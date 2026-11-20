# DoSync hub

English · **[Español](LEEME.md)**

A hub is a device that stays at home (an Android phone you no longer use, a Raspberry Pi, an old
computer) and controls your devices even when your phone isn't there. It is **optional**: without a hub, the phone is the
hub, as always.

With a hub:
- your devices keep responding when you leave home with your phone;
- the hub runs **the same engine as the app**: the same brands, catalog and infrared codes, so
  everything that works in the app works on the hub;
- it updates itself, always from this repository and only with releases signed by DoSync.

The hub is not on Google Play: you install it from here. The app (from Play or from this
repository) links to it in **Settings → DoSync hub**.

There are two ways to have a hub; pick whichever suits you:

| | An old phone | A Raspberry Pi or a computer |
|---|---|---|
| What you need | Android 8 or newer and its charger | a Linux device that stays on |
| How to install it | download the DoSync app and tap a button | one command in the terminal |
| Bluetooth and infrared | the phone's own, if it has them | through a Broadlink over Wi-Fi |
| Guide | [An old phone as a hub](#an-old-phone-as-a-hub) | [What you need](#what-you-need) onwards |

---

## An old phone as a hub

Got a phone sitting in a drawer since you bought a new one? Give it a second life: leave it at
home, plugged in and on Wi-Fi, and it becomes your DoSync hub. When you go out, your everyday phone
talks to that old phone, and it controls the devices in your home.

**Why it's worth it:**
- **You don't buy anything.** You use a phone you already have.
- **It installs like any app.** No terminal, no commands: download DoSync and tap a button.
- **It has more hardware than a Raspberry Pi.** It already has Wi-Fi and Bluetooth, and many
  phones (quite a few Xiaomi models, for example) have an infrared emitter for air conditioners
  and TVs. The hub uses all of it.
- **It has its own battery.** If the power goes out, it keeps working for a good while (as long as
  your router has power too).
- **It's the same hub.** It runs the same engine as the app, links the same way as the Raspberry Pi
  hub and answers from outside through the same encrypted relay.

**What you need:**
- A phone with **Android 8 or newer** (roughly, from 2017 onwards). A cracked screen or a worn
  battery is fine: it will always be plugged in.
- Its **charger**, in an outlet near the router or wherever the Wi-Fi reaches well.
- Your **home Wi-Fi**, the same one your devices use.
- No SIM card or phone line needed. Google Play needs a Google account; the APK from this
  repository doesn't even need that.

> Recommended: if the phone has your personal stuff on it, factory reset it before you start and
> use it only as a hub.

### 1. Install DoSync on the old phone

Pick either way (hub mode is in both, from version 0.3.1):

- **From Google Play** (it updates itself): on the old phone, with a Google account, follow the
  three steps under [Download](../README.md#download) and install DoSync.
- **From this repository** (no Google account needed):
  1. On the old phone, connected to your home Wi-Fi, open the browser and go to
     **https://github.com/giulianireg-spec/dosync-app-beta/releases/latest**.
  2. Tap **DoSync-…apk** to download it.
  3. Open it. Android will ask for permission to install apps from this source: tap **Settings**,
     turn on **Allow from this source** and go back. Tap **Install**.

> Your everyday phone can have either version: they link the same way.

### 2. Turn on hub mode

1. Open DoSync on the old phone and go to **Settings → This phone as a hub**.
2. Tap **Use as hub** and confirm.
3. If Android asks whether DoSync can **send notifications**, tap **Allow**. The ongoing "DoSync
   hub on" notification is what keeps the hub running.
   If it then asks about **nearby devices** (Bluetooth), tap **Allow** too: it's used for the
   Bluetooth devices you hand over.
4. The app opens Android's **battery** settings: find DoSync and set it to **Unrestricted** (or
   "Don't optimize"). Otherwise Android may put the hub to sleep to save battery and it would stop
   responding.
5. Depending on the phone's brand, there's one more permission. The app tells you which, but here
   they are:

| Brand | What to turn on |
|---|---|
| Xiaomi, Redmi, POCO | Settings → Apps → DoSync → **Autostart** on, and Battery saver → **No restrictions** |
| Samsung | Settings → Battery → Background usage limits → **Never sleeping apps** → add DoSync |
| Huawei, Honor | Settings → Battery → App launch → DoSync → **Manage manually**, everything on |
| OPPO, realme, OnePlus | Settings → Battery → DoSync → **Allow background activity** |
| vivo | Settings → Battery → Background power consumption → DoSync → **Allow** |
| Motorola, Lenovo | Settings → Battery → App battery usage → DoSync → **Unrestricted** |

On the **This phone as a hub** card you'll see:
- "On your home network: answering at 192.168.…": the hub already answers on your Wi-Fi.
- "Away from home: connected to the encrypted relay": it also answers from outside.
- A **QR code** and a 16-character code to link your everyday phone.

### 3. Link your everyday phone

With your everyday phone **on your home Wi-Fi**:

1. Open its **camera** and point it at the QR code on the old phone. Tap the link: DoSync opens and
   asks whether you want to link the hub. Tap **Link**.
2. If the camera doesn't open the app: in DoSync go to **Settings → DoSync hub → Link a hub** and
   type the code shown under the QR code.

The code is valid **once, for 10 minutes**. To link another phone (your partner's, for example) or
if it expired, tap **Link another phone** on the old phone.

### 4. Hand your devices over

On your everyday phone, go to **Settings → DoSync hub → Choose which devices the hub controls**,
check the devices (or all of them) and tap **Save**. They travel encrypted, together with what the
hub needs to control them. **Only the devices you hand over can be controlled from outside.** More
details in [Hand your devices over to the hub](#3-hand-your-devices-over-to-the-hub).

### 5. Leave it in place

- **Plug it in** and leave it where the Wi-Fi reaches well. If it can **limit charging to 80%**
  (Samsung: "Protect battery"; Xiaomi, Pixel and others have it under similar names), turn that
  on: sitting at 100% all the time wears the battery out.
- **Turn the screen off and forget about it.** You don't need to keep DoSync open or the screen
  on: the hub keeps answering with the screen off, the app closed and the phone idle, as long as
  the "DoSync hub on" notification is there.
- **If it restarts or the power goes out**, the hub comes back by itself when the phone turns on,
  with its linked phones and devices. One detail: if the phone has a **PIN, pattern or password**,
  Android doesn't let any app start until you unlock it once after it turns on. Since the old phone
  stays at home, the easiest is to set its screen lock to **None** or **Swipe** (Settings →
  Security → Screen lock). If you'd rather keep a PIN, unlock it once every time it restarts.
- To keep it quiet, turn the volume down or set it to "Do not disturb".

### Away from home

That's it: when you go out, open DoSync on your everyday phone and control your devices as usual.
The app talks to the old phone through the **DoSync encrypted relay**: it can't read the messages
and you don't need to open ports on your router. In **Settings → DoSync hub** you'll see "Away from
home: connected through the encrypted relay".

### Updates

The brand catalog and infrared codes update themselves. The app depends on where you installed
it from: **from Google Play** it updates itself like any app (keep automatic updates on); **from
this repository**, the old phone shows a notice and Android asks for a tap to install it, so it's
worth checking on it now and then.

### Stop using it as a hub

On the old phone: **Settings → This phone as a hub → Stop using as hub**.
- **Turn off** stops it and keeps the linked phones and devices, in case you turn it back on.
- **Turn off and erase everything** erases the linked phones' keys and the devices.

On your everyday phone, **Settings → DoSync hub → Unlink** brings the devices back to the phone.

### Troubleshooting an old phone

- **"Away from home: no connection to the relay"**: the old phone has no internet. Check that it's
  on Wi-Fi and that the Wi-Fi has internet.
- **It works for a while and then stops responding**: Android is putting it to sleep. Check step 2
  (battery **Unrestricted** and your brand's permission) and that the "DoSync hub on" notification
  is still there.
- **It restarted and doesn't respond**: if it has a PIN, pattern or password, unlock it once (see
  step 5).
- **"This phone as a hub" isn't in Settings**: that DoSync is older than 0.3.1. Update it (from
  Google Play or with the APK from this repository).

---

# Hub on a Raspberry Pi or a computer

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
