# Hub DoSync

**[English](README.md)** · Español

Un hub es un equipo que queda en tu casa (un teléfono Android que ya no usas, una Raspberry Pi,
una computadora vieja) y maneja tus aparatos aunque el teléfono no esté. Es **opcional**: sin hub, el teléfono hace de hub,
como siempre.

Con un hub:
- tus aparatos siguen respondiendo cuando sales de casa con el teléfono;
- el hub corre **el mismo motor que la app**: las mismas marcas, el mismo catálogo y los mismos
  códigos infrarrojos, así que todo lo que funciona en la app funciona en el hub;
- se actualiza solo, siempre desde este repositorio y solo con versiones firmadas por DoSync.

El hub no está en Google Play: se instala desde aquí. La app (de Play o de este repositorio) se
vincula con él desde **Ajustes → Hub DoSync**.

Hay dos formas de tener un hub; elige la que te quede más cómoda:

| | Un teléfono viejo | Una Raspberry Pi o una computadora |
|---|---|---|
| Qué necesitas | un Android 8 o más nuevo y su cargador | un equipo con Linux siempre encendido |
| Cómo se instala | bajas la app DoSync y tocas un botón | un comando en la terminal |
| Bluetooth e infrarrojo | los del teléfono, si los tiene | con un Broadlink por WiFi |
| Guía | [Un teléfono viejo como hub](#un-teléfono-viejo-como-hub) | [Qué necesitas](#qué-necesitas) y siguientes |

---

## Un teléfono viejo como hub

¿Te quedó un teléfono en un cajón cuando compraste uno nuevo? Dale una segunda vida: déjalo en
casa, enchufado y en el WiFi, y será tu hub DoSync. Cuando salgas, tu teléfono de siempre le
habla a ese teléfono viejo y él maneja los aparatos de tu casa.

**Por qué conviene:**
- **No compras nada.** Usas un teléfono que ya tienes.
- **Se instala como cualquier app.** Sin terminal ni comandos: bajas DoSync y tocas un botón.
- **Trae más hardware que una Raspberry.** Ya tiene WiFi y Bluetooth, y muchos (por ejemplo,
  bastantes Xiaomi) traen emisor infrarrojo para aires y teles. Todo eso lo usa el hub.
- **Tiene su propia batería.** Si se corta la luz, sigue funcionando un buen rato (mientras el
  router también tenga energía).
- **Es el mismo hub.** Corre el mismo motor que la app, se vincula igual que el de Raspberry y
  responde fuera de casa por el mismo relevo cifrado.

**Qué necesitas:**
- Un teléfono **Android 8 o más nuevo** (más o menos, de 2017 en adelante). Puede tener la
  pantalla rajada o la batería gastada: va a estar siempre enchufado.
- Su **cargador**, en un enchufe cerca del router o donde el WiFi llegue bien.
- El **WiFi de tu casa**, el mismo de tus aparatos.
- No hace falta chip ni línea. Desde Google Play hace falta una cuenta de Google; con el APK de
  este repositorio, ni eso.

> Recomendado: si el teléfono tiene cosas tuyas, restablécelo de fábrica antes de empezar y úsalo
> solo como hub.

### 1. Instalar DoSync en el teléfono viejo

Elige una de las dos formas (el modo hub está en las dos, desde la versión 0.3.1):

- **Desde Google Play** (se actualiza sola): en el teléfono viejo, con una cuenta de Google, sigue
  los tres pasos de [Descargar](../LEEME.md#descargar) e instala DoSync.
- **Desde este repositorio** (sin cuenta de Google):
  1. En el teléfono viejo, conectado al WiFi de tu casa, abre el navegador y entra a
     **https://github.com/giulianireg-spec/dosync-app-beta/releases/latest**.
  2. Toca **DoSync-…apk** para bajarlo.
  3. Ábrelo. Android va a pedir permiso para instalar apps de esta fuente: toca **Configuración**,
     activa **Permitir de esta fuente** y vuelve. Toca **Instalar**.

> Tu teléfono de siempre puede tener cualquiera de las dos versiones: se vinculan igual.

### 2. Prenderle el modo hub

1. Abre DoSync en el teléfono viejo y ve a **Ajustes → Este teléfono como hub**.
2. Toca **Usar como hub** y confirma.
3. Si Android pregunta si DoSync puede **mostrar notificaciones**, toca **Permitir**. La
   notificación fija "Hub DoSync activo" es la que mantiene al hub funcionando.
   Si después pregunta por **dispositivos cercanos** (Bluetooth), toca **Permitir** también: lo
   usa para los aparatos Bluetooth que le pases.
4. La app abre los ajustes de **batería**: busca DoSync y déjalo **Sin restricciones** (o "No
   optimizar"). Si no, Android puede dormir al hub para ahorrar batería y dejaría de responder.
5. Según la marca del teléfono, hay un permiso más. La app te dice cuál, pero son estos:

| Marca | Qué activar |
|---|---|
| Xiaomi, Redmi, POCO | Ajustes → Apps → DoSync → **Autoinicio** activado, y Ahorro de batería → **Sin restricciones** |
| Samsung | Ajustes → Batería → Límites de uso en segundo plano → **Apps que nunca se suspenden** → agregar DoSync |
| Huawei, Honor | Ajustes → Batería → Inicio de aplicaciones → DoSync → **Gestionar manualmente**, con todo activado |
| OPPO, realme, OnePlus | Ajustes → Batería → DoSync → **Permitir actividad en segundo plano** |
| vivo | Ajustes → Batería → Consumo en segundo plano → DoSync → **Permitir** |
| Motorola, Lenovo | Ajustes → Batería → Uso de batería de apps → DoSync → **Sin restricciones** |

En la tarjeta **Este teléfono como hub** vas a ver:
- "En la red de la casa: atiende en 192.168.…": el hub ya responde en tu WiFi.
- "Fuera de casa: conectado al relevo cifrado": ya responde también desde afuera.
- Un **código QR** y un código de 16 letras para vincular tu teléfono de siempre.

### 3. Vincular tu teléfono de siempre

Con tu teléfono de siempre **en el WiFi de tu casa**:

1. Abre su **cámara** y apunta al QR que muestra el teléfono viejo. Toca el enlace: se abre DoSync
   y pregunta si quieres vincular el hub. Toca **Vincular**.
2. Si la cámara no abre la app: en DoSync ve a **Ajustes → Hub DoSync → Vincular un hub** y
   escribe el código que aparece debajo del QR.

El código vale **una sola vez y por 10 minutos**. Para vincular otro teléfono (el de tu pareja,
por ejemplo) o si se venció, toca **Vincular otro teléfono** en el teléfono viejo.

### 4. Pasarle tus aparatos

En tu teléfono de siempre, ve a **Ajustes → Hub DoSync → Elegir qué aparatos maneja el hub**,
marca los aparatos (o todos) y toca **Guardar**. Viajan cifrados, junto con lo que el hub necesita
para manejarlos. **Solo los aparatos que le pasas se pueden manejar desde afuera.** Más detalles en
[Pasarle tus aparatos al hub](#3-pasarle-tus-aparatos-al-hub).

### 5. Dejarlo en su lugar

- **Enchúfalo** y déjalo donde el WiFi llegue bien. Si tiene la opción de **cargar solo hasta el
  80 %** (Samsung: "Proteger batería"; Xiaomi, Pixel y otros la tienen con nombres parecidos),
  actívala: estar siempre al 100 % gasta la batería.
- **Apaga la pantalla y olvídate.** No hace falta dejar DoSync abierto ni la pantalla encendida:
  el hub sigue respondiendo con la pantalla apagada, la app cerrada y el teléfono en reposo,
  mientras se vea la notificación "Hub DoSync activo".
- **Si se reinicia o se corta la luz**, el hub vuelve solo al encender el teléfono, con los
  teléfonos vinculados y los aparatos. Un detalle: si el teléfono tiene **PIN, patrón o
  contraseña**, Android no deja arrancar ninguna app hasta que lo desbloqueas la primera vez
  después de encenderlo. Como el teléfono viejo queda en casa, lo más cómodo es ponerle bloqueo de
  pantalla **Ninguno** o **Deslizar** (Ajustes → Seguridad → Bloqueo de pantalla). Si prefieres
  dejarle un PIN, desbloquéalo una vez cada vez que se reinicie.
- Para que no moleste, puedes bajarle el volumen o ponerlo en "No molestar".

### Fuera de casa

Listo: cuando salgas, abre DoSync en tu teléfono de siempre y maneja tus aparatos como siempre.
La app le habla al teléfono viejo a través del **relevo cifrado de DoSync**: no puede leer los
mensajes y no hay que abrir puertos en el router. En **Ajustes → Hub DoSync** vas a ver "Fuera de
casa: conectado por el relevo cifrado".

### Actualizaciones

El catálogo de marcas y los códigos infrarrojos se actualizan solos. La app, según de dónde la
instalaste: **desde Google Play** se actualiza sola, como cualquier app (deja activadas las
actualizaciones automáticas); **desde este repositorio**, el teléfono viejo muestra un aviso y
Android pide un toque para instalarla, así que conviene mirarlo de vez en cuando.

### Dejar de usarlo como hub

En el teléfono viejo: **Ajustes → Este teléfono como hub → Dejar de usar como hub**.
- **Apagar** lo detiene y guarda los teléfonos vinculados y los aparatos, por si lo vuelves a
  prender.
- **Apagar y borrar todo** borra las claves de los teléfonos vinculados y los aparatos.

En tu teléfono de siempre, **Ajustes → Hub DoSync → Desvincular** devuelve los aparatos al teléfono.

### Problemas comunes con un teléfono viejo

- **"Fuera de casa: sin conexión con el relevo"**: el teléfono viejo no tiene internet. Revisa
  que esté en el WiFi y que el WiFi tenga internet.
- **Funciona un rato y después deja de responder**: Android lo está durmiendo. Revisa el paso 2
  (batería **Sin restricciones** y el permiso de tu marca) y que la notificación "Hub DoSync
  activo" siga ahí.
- **Se reinició y no responde**: si tiene PIN, patrón o contraseña, desbloquéalo una vez (ver el
  paso 5).
- **No aparece "Este teléfono como hub" en Ajustes**: esa versión de DoSync es anterior a la 0.3.1.
  Actualízala (desde Google Play o con el APK de este repositorio).

---

# Hub en una Raspberry Pi o una computadora

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
