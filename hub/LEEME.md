# Hub DoSync

**[English](README.md)** · Español

Un hub es un equipo que queda en tu casa (una Raspberry Pi, una computadora vieja, un mini PC) y
maneja tus aparatos aunque el teléfono no esté. Es **opcional**: sin hub, el teléfono hace de hub,
como siempre.

Con un hub:
- tus aparatos siguen respondiendo cuando sales de casa con el teléfono;
- el hub corre **el mismo motor que la app**: las mismas marcas, el mismo catálogo y los mismos
  códigos infrarrojos, así que todo lo que funciona en la app funciona en el hub;
- se actualiza solo, siempre desde este repositorio y solo con versiones firmadas por DoSync.

El hub no está en Google Play: se instala desde aquí. La app (de Play o de este repositorio) se
vincula con él desde **Ajustes → Hub DoSync**.

---

## Qué necesitas

- **Un equipo que quede siempre encendido en tu casa**, con Linux:
  - una **Raspberry Pi 3, 4 o 5** con **Raspberry Pi OS de 64 bits**; o
  - cualquier computadora o mini PC con Debian, Ubuntu u otro Linux con systemd.
- Que esté **en la misma red WiFi** que tus aparatos (por cable o WiFi).
- Internet durante la instalación (para bajar el hub) y después para actualizarse.

No hace falta que tenga Bluetooth, infrarrojo ni nada especial. Ver
[Hardware del hub](#hardware-del-hub).

## 1. Instalar el hub

En el equipo que va a hacer de hub, abre una terminal (o conéctate por SSH) y pega:

```bash
curl -fsSL https://raw.githubusercontent.com/giulianireg-spec/dosync-app-beta/main/hub/install.sh | sudo sh
```

El instalador hace todo solo, en un par de minutos:
1. prepara la carpeta del hub (`/opt/dosync-hub`) y un usuario propio para el servicio;
2. instala la versión de Node.js que usa el hub, solo para él (no toca la del sistema);
3. baja la última versión del hub de este repositorio y **comprueba su firma**: si la firma no es
   de DoSync, no la instala;
4. crea el servicio `dosync-hub`, que arranca solo cada vez que se enciende el equipo.

Al terminar muestra un **código QR** y un código de 16 letras para vincular el teléfono.

> ¿Ya lo tenías instalado? Correr el mismo comando lo repara o lo pone al día, sin perder los
> teléfonos vinculados ni los aparatos.

## 2. Vincular el teléfono

Con el teléfono **conectado al WiFi de tu casa**:

1. Abre la **cámara** del teléfono y apunta al QR que mostró el instalador. Toca el enlace: se
   abre DoSync y pregunta si quieres vincular el hub. Toca **Vincular**.
2. Si la cámara no abre la app: en DoSync ve a **Ajustes → Hub DoSync → Vincular un hub** y
   escribe el código que aparece debajo del QR (por ejemplo `7K4M-Q9XP-2HDR-8WTF`). La app busca
   el hub en tu red y se vincula.

El código vale **una sola vez y por 10 minutos**. Para vincular otro teléfono, o si se venció,
pide uno nuevo en el equipo del hub:

```bash
dosync-hub vincular
```

También puedes ver el QR desde el navegador de la computadora o del teléfono, entrando a
`http://IP-DEL-HUB:47300` mientras la vinculación está abierta.

En **Ajustes → Hub DoSync** vas a ver "Conectado", la versión del hub y cuántos aparatos maneja.

## 3. Pasarle tus aparatos al hub

El hub maneja **solo los aparatos que le transfieres** desde el teléfono. Así decides qué queda a
cargo del hub.

En **Ajustes → Hub DoSync → Elegir qué aparatos maneja el hub**, marca los aparatos (o todos) y
toca **Guardar**. Viajan por el canal cifrado junto con lo que el hub necesita para manejarlos: las
cuentas de las marcas, las huellas de los certificados y los adaptadores propios. La app los sigue
mostrando como siempre, con la nota "Lo maneja el hub DoSync", y sus órdenes, escenas y rutinas van
a través del hub.

Para devolver un aparato al teléfono, desmárcalo y guarda. Si desvinculas el hub, todos vuelven al
teléfono.

> Las teles Android TV, los Fire TV (ADB) y Bosch Smart Home se emparejan con una clave que el
> teléfono guarda en su chip seguro y que nunca sale de él; por eso esos aparatos quedan en el
> teléfono.

## 4. Fuera de casa

Fuera de tu WiFi, la app le habla al hub a través del **relevo cifrado de DoSync**. El hub abre
una conexión de salida hacia el relevo y tu teléfono también; el relevo solo pasa los mensajes y
**no puede leerlos**, porque van cifrados de punta a punta con la clave que acordaron el teléfono y
el hub al vincularse. No hace falta abrir puertos en el router ni configurar nada.

---

## Actualizaciones

El hub busca versiones nuevas cada 6 horas, **solo en este repositorio** (versiones `hub-vX.Y.Z`).
Antes de instalar una comprueba que esté firmada por DoSync. Si una versión nueva no arranca bien,
vuelve sola a la anterior.

Para ver la versión: `dosync-hub version`.

## Hardware del hub

El hub tiene **todas las funciones de la app**, tenga o no el hardware. Si le falta algo, la
función sigue disponible y te dice qué sumar, como pasa en un teléfono sin emisor infrarrojo:

| Función | Con hardware propio | Si el equipo no lo tiene |
|---|---|---|
| WiFi / red de la casa | siempre | — |
| Infrarrojo (aires, teles) | un LED infrarrojo en los pines de la Raspberry (LIRC) | un **Broadlink** RM4 por WiFi |
| Radiofrecuencia 433/315 MHz | — | un **Broadlink RM4 Pro** por WiFi |
| Bluetooth | el Bluetooth del equipo | un aparato con puente WiFi |
| Zigbee / Z-Wave | un dongle USB con Zigbee2MQTT | el puente de la marca |
| Sensores en los pines | GPIO de la Raspberry | — |

## Comandos útiles

| Comando | Qué hace |
|---|---|
| `dosync-hub vincular` | muestra un QR nuevo para vincular un teléfono |
| `dosync-hub estado` | dice si el hub está funcionando y qué versión tiene |
| `dosync-hub version` | la versión instalada |
| `sudo systemctl restart dosync-hub` | reinicia el hub |
| `journalctl -u dosync-hub -n 50` | las últimas líneas del registro del hub |

## Seguridad

- Solo un teléfono que se vinculó con un código de un solo uso, leído en el propio hub, puede
  hablarle. Cada teléfono tiene su propia clave, guardada en el almacenamiento seguro del teléfono.
- Todo viaja cifrado (Noise NNpsk0: X25519, ChaCha20-Poly1305, SHA-256), en casa y por el relevo.
- El hub solo se conecta a aparatos de la red local, y a internet solo para las nubes de las
  marcas que transferiste y para buscar actualizaciones en este repositorio.
- Los datos del hub quedan en `/var/lib/dosync-hub`, que solo puede leer el usuario del servicio.
- Desvincular un teléfono (en **Ajustes → Hub DoSync → Desvincular**) borra su clave del hub.

## Desinstalar

```bash
sudo systemctl disable --now dosync-hub
sudo rm -rf /opt/dosync-hub /var/lib/dosync-hub /etc/systemd/system/dosync-hub.service /usr/local/bin/dosync-hub
sudo userdel dosync-hub
```

## Problemas comunes

- **"No encontré ningún hub DoSync en esta red"**: el teléfono tiene que estar en el mismo WiFi que
  el hub. Comprueba que el hub funciona con `dosync-hub estado`.
- **"El hub no está esperando una vinculación"**: el código venció o ya se usó. Pide uno nuevo con
  `dosync-hub vincular`.
- **El instalador dice que el equipo es de 32 bits**: instala Raspberry Pi OS de 64 bits (Raspberry
  Pi Imager → Raspberry Pi OS (64-bit)).

¿Otro problema? Abre un [issue](https://github.com/giulianireg-spec/dosync-app-beta/issues) o
escribe a rgiuliani@dosync.dev.
