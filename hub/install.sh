#!/bin/sh
# Instalador del hub DoSync — https://github.com/giulianireg-spec/dosync-app-beta/tree/main/hub
#
#   curl -fsSL https://raw.githubusercontent.com/giulianireg-spec/dosync-app-beta/main/hub/install.sh | sudo sh
#
# Para Raspberry Pi OS, Debian, Ubuntu y cualquier Linux con systemd (64 bits, ARM o Intel/AMD).
# Instala todo en /opt/dosync-hub (incluido su propio Node.js, sin tocar el del sistema), crea
# el servicio "dosync-hub", lo arranca y muestra el QR para vincular el celular.
# Volver a correrlo actualiza o repara la instalación sin perder lo vinculado.
set -eu

REPO="giulianireg-spec/dosync-app-beta"
ROOT=/opt/dosync-hub
DATA=/var/lib/dosync-hub
NODE_VERSION=24.22.2
PUBKEY=86117a02ba966a63ef7934d4d29367d53782fd6a0eafbe8cb98bc049d8b5e5ee

say() { printf '\n\033[1m%s\033[0m\n' "$*"; }
fail() { printf '\n\033[31mNo se pudo instalar: %s\033[0m\n' "$*" >&2; exit 1; }

[ "$(id -u)" -eq 0 ] || fail "corre el instalador con sudo."
[ "$(uname -s)" = Linux ] || fail "el hub funciona en Linux (Raspberry Pi OS, Debian, Ubuntu…)."
command -v systemctl >/dev/null || fail "este sistema no tiene systemd."
case "$(uname -m)" in
  aarch64|arm64) ARCH=arm64 ;;
  x86_64|amd64) ARCH=x64 ;;
  armv7l) fail "este equipo es de 32 bits. En una Raspberry Pi 3, 4 o 5, instala Raspberry Pi OS de 64 bits." ;;
  *) fail "procesador no soportado ($(uname -m))." ;;
esac
for c in curl tar openssl; do command -v $c >/dev/null || { apt-get update -qq && apt-get install -y -qq curl tar xz-utils openssl >/dev/null; break; }; done

say "1/4  Preparando la carpeta del hub"
id dosync-hub >/dev/null 2>&1 || useradd --system --home "$DATA" --shell /usr/sbin/nologin dosync-hub
for g in gpio bluetooth dialout video; do getent group $g >/dev/null && usermod -aG $g dosync-hub || true; done
mkdir -p "$ROOT/versions" "$DATA"
chown dosync-hub:dosync-hub "$DATA"; chmod 700 "$DATA"

say "2/4  Instalando Node.js $NODE_VERSION (solo para el hub)"
if [ ! -x "$ROOT/node/bin/node" ] || [ "$("$ROOT/node/bin/node" --version)" != "v$NODE_VERSION" ]; then
  TMP=$(mktemp -d)
  F="node-v$NODE_VERSION-linux-$ARCH.tar.xz"
  curl -fsSL "https://nodejs.org/dist/v$NODE_VERSION/$F" -o "$TMP/$F"
  curl -fsSL "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt" -o "$TMP/SUMS"
  (cd "$TMP" && grep " $F\$" SUMS | sha256sum -c - >/dev/null) || fail "la descarga de Node.js no coincide con su suma de control."
  rm -rf "$ROOT/node.new" && mkdir -p "$ROOT/node.new"
  tar -xJf "$TMP/$F" -C "$ROOT/node.new" --strip-components=1
  rm -rf "$ROOT/node" && mv "$ROOT/node.new" "$ROOT/node"
  rm -rf "$TMP"
fi
NODE="$ROOT/node/bin/node"

say "3/4  Descargando el hub DoSync (versión firmada del repositorio)"
TMP=$(mktemp -d)
if [ -n "${DOSYNC_HUB_FILE:-}" ]; then           # para probar una versión local: archivo + .sig al lado
  cp "$DOSYNC_HUB_FILE" "$TMP/dosync-hub.js"; cp "$DOSYNC_HUB_FILE.sig" "$TMP/dosync-hub.js.sig"
  VERSION=$("$NODE" "$TMP/dosync-hub.js" version)
else
  TAG=$(curl -fsSL -H 'Accept: application/vnd.github+json' "https://api.github.com/repos/$REPO/releases?per_page=30" \
    | "$NODE" -e 'let s="";process.stdin.on("data",d=>s+=d).on("end",()=>{const r=JSON.parse(s).filter(x=>!x.draft&&!x.prerelease&&/^hub-v\d+\.\d+\.\d+$/.test(x.tag_name)).map(x=>x.tag_name).sort((a,b)=>{const p=t=>t.slice(5).split(".").map(Number);const[x,y]=[p(a),p(b)];for(let i=0;i<3;i++)if(x[i]!==y[i])return y[i]-x[i];return 0});if(!r.length)process.exit(1);console.log(r[0])})') \
    || fail "no encontré ninguna versión del hub publicada."
  VERSION=${TAG#hub-v}
  curl -fsSL "https://github.com/$REPO/releases/download/$TAG/dosync-hub.js" -o "$TMP/dosync-hub.js"
  curl -fsSL "https://github.com/$REPO/releases/download/$TAG/dosync-hub.js.sig" -o "$TMP/dosync-hub.js.sig"
fi
# La firma Ed25519 cubre "dosync-hub <versión>\n" + el archivo. Sin firma válida no se instala.
"$NODE" -e '
const fs=require("fs"),c=require("crypto");
const [v,f,s,k]=process.argv.slice(1);
const key=c.createPublicKey({key:Buffer.concat([Buffer.from("302a300506032b6570032100","hex"),Buffer.from(k,"hex")]),format:"der",type:"spki"});
const msg=Buffer.concat([Buffer.from("dosync-hub "+v+"\n"),fs.readFileSync(f)]);
process.exit(c.verify(null,msg,key,Buffer.from(fs.readFileSync(s,"utf8").trim(),"hex"))?0:1);
' "$VERSION" "$TMP/dosync-hub.js" "$TMP/dosync-hub.js.sig" "$PUBKEY" || fail "la descarga no tiene la firma de DoSync."
mkdir -p "$ROOT/versions/$VERSION"
cp "$TMP/dosync-hub.js" "$ROOT/versions/$VERSION/dosync-hub.js"
rm -rf "$TMP"
ln -sfn "$ROOT/versions/$VERSION" "$ROOT/current"
rm -f "$ROOT/pending"
chown -R dosync-hub:dosync-hub "$ROOT/versions"
# El hub se actualiza solo: necesita poder escribir sus versiones y cambiar "current".
chown dosync-hub:dosync-hub "$ROOT"
chown -h dosync-hub:dosync-hub "$ROOT/current"

cat > /usr/local/bin/dosync-hub <<SH
#!/bin/sh
exec "$NODE" "$ROOT/current/dosync-hub.js" "\$@"
SH
chmod 755 /usr/local/bin/dosync-hub

say "4/4  Creando el servicio"
cat > /etc/systemd/system/dosync-hub.service <<UNIT
[Unit]
Description=Hub DoSync
After=network-online.target
Wants=network-online.target

[Service]
User=dosync-hub
Environment=DOSYNC_HUB_DATA=$DATA
Environment=DOSYNC_HUB_ROOT=$ROOT
ExecStart=$NODE $ROOT/current/dosync-hub.js
Restart=always
RestartSec=3
# Puede usar la red de la casa (incluido el broadcast para encontrar aparatos), nada más.
AmbientCapabilities=CAP_NET_BIND_SERVICE CAP_NET_RAW
NoNewPrivileges=true
ProtectSystem=full
ProtectHome=true
PrivateTmp=true
ReadWritePaths=$ROOT $DATA

[Install]
WantedBy=multi-user.target
UNIT
systemctl daemon-reload
systemctl enable dosync-hub >/dev/null 2>&1
systemctl restart dosync-hub

i=0; until dosync-hub estado >/dev/null 2>&1; do i=$((i+1)); [ $i -gt 30 ] && fail "el hub no arrancó. Revisa: journalctl -u dosync-hub -n 50"; sleep 1; done

say "Listo: el hub DoSync $VERSION está funcionando y se va a actualizar solo."
dosync-hub vincular
