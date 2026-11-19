# DoSync hub

English · **[Español](LEEME.md)**

A hub is a device that stays at home (a Raspberry Pi, an old computer, a mini PC) and controls
your devices even when your phone isn't there. It is **optional**: without a hub, the phone is the
hub, as always.

With a hub:
- your devices keep responding when you leave home with your phone;
- the hub runs **the same engine as the app**: the same brands, catalog and infrared codes, so
  everything that works in the app works on the hub;
- it updates itself, always from this repository and only with releases signed by DoSync.

The hub is not on Google Play: you install it from here. The app (from Play or from this
repository) links to it in **Settings → DoSync hub**.

---

## What you need

- **A device that stays on at home**, running Linux:
  - a **Raspberry Pi 3, 4 or 5** with **Raspberry Pi OS (64-bit)**; or
  - any computer or mini PC with Debian, Ubuntu or another Linux with systemd.
- It must be **on the same network** as your devices (Wi-Fi or cable).
- Internet during installation (to download the hub) and afterwards for updates.

It doesn't need Bluetooth, infrared or anything special. See [Hub hardware](#hub-hardware).

## 1. Install the hub

On the device that will be the hub, open a terminal (or connect over SSH) and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/giulianireg-spec/dosync-app-beta/main/hub/install.sh | sudo sh
```

The installer does everything in a couple of minutes:
1. creates the hub folder (`/opt/dosync-hub`) and a dedicated user for the service;
2. installs the Node.js version the hub uses, just for the hub (the system's is left alone);
3. downloads the latest hub release from this repository and **checks its signature**: if it
   isn't signed by DoSync, it is not installed;
4. creates the `dosync-hub` service, which starts by itself every time the device boots.

When it finishes it shows a **QR code** and a 16-character code to link your phone.

> Already installed? Running the same command repairs or updates it, keeping linked phones and
> devices.

## 2. Link your phone

With the phone **on your home Wi-Fi**:

1. Open the phone's **camera** and point it at the QR code the installer showed. Tap the link:
   DoSync opens and asks whether to link the hub. Tap **Link**.
2. If the camera doesn't open the app: in DoSync go to **Settings → DoSync hub → Link a hub** and
   type the code shown under the QR code (for example `7K4M-Q9XP-2HDR-8WTF`). The app finds the
   hub on your network and links to it.

The code works **once, for 10 minutes**. To link another phone, or if it expired, ask the hub for a
new one:

```bash
dosync-hub vincular
```

You can also see the QR code from a browser on your computer or phone at `http://HUB-IP:47300`
while linking is open.

**Settings → DoSync hub** then shows "Connected", the hub version and how many devices it handles.

## 3. Hand your devices over to the hub

The hub only controls **the devices you transfer** from your phone, so you decide what it handles.

In **Settings → DoSync hub → Choose which devices the hub controls**, check the devices (or all of
them) and tap **Save**. They travel over the encrypted channel together with what the hub needs to
control them: brand accounts, certificate fingerprints and custom adapters. The app keeps showing
them as before, with the note "Controlled by the DoSync hub", and their commands, scenes and
routines go through the hub.

To give a device back to the phone, uncheck it and save. If you unlink the hub, they all go back to
the phone.

> Android TVs, Fire TVs (ADB) and Bosch Smart Home are paired with a key the phone keeps in its
> secure chip and that never leaves it, so those devices stay on the phone.

## 4. Away from home

Outside your Wi-Fi, the app talks to the hub through the **DoSync encrypted relay**. The hub and
your phone both open outgoing connections to the relay; the relay only passes messages along and
**cannot read them**, because they are end-to-end encrypted with the key the phone and hub agreed
on when linking. No router ports to open, nothing to set up.

---

## Updates

The hub checks for new versions every 6 hours, **only in this repository** (`hub-vX.Y.Z`
releases). Before installing one it checks the DoSync signature. If a new version doesn't start
properly, it rolls back to the previous one by itself.

To see the version: `dosync-hub version`.

## Hub hardware

The hub has **every feature of the app**, whether or not it has the hardware. If something is
missing, the feature is still there and tells you what to add, just like a phone without an
infrared emitter:

| Feature | With its own hardware | If the device doesn't have it |
|---|---|---|
| Wi-Fi / home network | always | — |
| Infrared (ACs, TVs) | an infrared LED on the Raspberry Pi pins (LIRC) | a **Broadlink** RM4 over Wi-Fi |
| Radio frequency 433/315 MHz | — | a **Broadlink RM4 Pro** over Wi-Fi |
| Bluetooth | the device's Bluetooth | a device with a Wi-Fi bridge |
| Zigbee / Z-Wave | a USB dongle with Zigbee2MQTT | the brand's bridge |
| Sensors on the pins | Raspberry Pi GPIO | — |

## Useful commands

| Command | What it does |
|---|---|
| `dosync-hub vincular` | shows a new QR code to link a phone |
| `dosync-hub estado` | tells whether the hub is running and its version |
| `dosync-hub version` | the installed version |
| `sudo systemctl restart dosync-hub` | restarts the hub |
| `journalctl -u dosync-hub -n 50` | the hub's latest log lines |

## Security

- Only a phone that linked with a one-time code, read on the hub itself, can talk to it. Each
  phone has its own key, kept in the phone's secure storage.
- Everything is encrypted (Noise NNpsk0: X25519, ChaCha20-Poly1305, SHA-256), at home and through
  the relay.
- The hub only connects to devices on your local network, and to the internet only for the brand
  clouds you transferred and to check for updates in this repository.
- The hub's data lives in `/var/lib/dosync-hub`, readable only by the service user.
- Unlinking a phone (**Settings → DoSync hub → Unlink**) deletes its key from the hub.

## Uninstall

```bash
sudo systemctl disable --now dosync-hub
sudo rm -rf /opt/dosync-hub /var/lib/dosync-hub /etc/systemd/system/dosync-hub.service /usr/local/bin/dosync-hub
sudo userdel dosync-hub
```

## Troubleshooting

- **"I couldn't find a DoSync hub on this network"**: the phone must be on the same Wi-Fi as the
  hub. Check the hub is running with `dosync-hub estado`.
- **"The hub isn't waiting to be linked"**: the code expired or was used. Get a new one with
  `dosync-hub vincular`.
- **The installer says the device is 32-bit**: install Raspberry Pi OS (64-bit) (Raspberry Pi
  Imager → Raspberry Pi OS (64-bit)).

Another problem? Open an [issue](https://github.com/giulianireg-spec/dosync-app-beta/issues) or
write to rgiuliani@dosync.dev.
