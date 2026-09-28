# 📱 Phone Only Setup

Use this method if you don't have home Wi-Fi available, or just want the simplest path. The Pi connects straight to your phone's hotspot from the first boot.

> [!NOTE]
> The system upgrade in Step 5 downloads over your hotspot and used about **1.24 GB** in testing. If you're on a limited data plan, use the [Computer Assisted Setup](computer-assisted-setup.md) instead.

**Contents**
1. [Flash the SD card](#1-flash-the-sd-card-on-your-computer)
2. [Install the Android apps](#2-install-the-android-apps)
3. [Boot the Pi](#3-boot-the-pi)
4. [Connect over SSH](#4-connect-over-ssh-from-termux)
5. [Update Kali](#5-update-kali)
6. [Start the VNC server](#6-start-the-vnc-server)
7. [Connect with NetHunter KeX](#7-connect-with-nethunter-kex)

---

## 1. Flash the SD card (on your computer)

1. Download and open **[Raspberry Pi Imager](https://www.raspberrypi.com/software/)**.
2. **Choose Device** → `Raspberry Pi Zero 2 W`
3. **Choose OS** → `Other specific-purpose OS` → `Kali Linux` → `Raspberry Pi Zero 2 W`
   > ⚠️ Not the *Pi-Tail* image.
4. **Choose Storage** → your microSD card.
5. Click **Next** → **Edit Settings** and fill in:

   | Setting | Value |
   |---------|-------|
   | Username / password | `kali` / `kali` *(change after first login)* |
   | Wireless LAN | Your **phone hotspot** SSID and password |
   | Wireless LAN country | Your country |
   | Locale | Your timezone and keyboard layout |
   | **Services** tab | ✅ Enable SSH (password authentication) |

6. Click **Save** → **Yes** to apply the custom settings, then write the card.

## 2. Install the Android apps

1. *(If your phone requires it)* enable Developer Options: **Settings → About phone → Software information** → tap **Build number** ~7 times.
2. Open your browser and go to **[store.nethunter.com](https://store.nethunter.com/)**. Download and install the NetHunter Store app.
   - When prompted, allow your browser to **install unknown apps**.
3. In the NetHunter Store, tap the 🔍 search icon (bottom right) and install:
   - **Termux** (v0.118.0 tested)
   - **NetHunter KeX**

> [!TIP]
> Don't install Termux from the Google Play Store — that version is outdated and no longer maintained.

## 3. Boot the Pi

1. Remove the SD card from your computer and insert it into the Pi Zero 2 W.
2. **Turn on your phone's hotspot first.**
3. Plug the micro-USB cable into the Pi's **PWR IN** port (the right-most micro-USB port, with the SD slot on your left).
4. Wait for the Pi to connect — the first boot can take **5 minutes or more** while it resizes the filesystem.
5. Open your hotspot settings and look for a connected device named something like `kali-raspberry-pi-zero-2-w`. Tap it and note the **IP address**.

> [!NOTE]
> The IP depends on your phone (for example `10.x.x.x` or `192.168.x.x`). Wherever this guide says `PI_IP_ADDRESS`, use the one your phone shows.

## 4. Connect over SSH (from Termux)

Open **Termux** and run:

```bash
pkg update && pkg upgrade -y
pkg install openssh -y
ssh kali@PI_IP_ADDRESS
```

- Type `yes` to accept the host fingerprint.
- Enter the password `kali` (nothing appears while typing — that's normal).

You should now see the Kali prompt:

```
┌──(kali㉿kali-raspberry-pi-zero-2-w)-[~]
└─$
```

## 5. Update Kali

```bash
sudo apt update
sudo apt full-upgrade -y
```

☕ This takes a while on the Zero 2 W. When it finishes, change the default password:

```bash
passwd
```

## 6. Start the VNC server

Run the included setup script (or do it by hand below):

```bash
curl -fsSL https://raw.githubusercontent.com/CyberChuck01/Kali-Pi-Android/main/scripts/setup-vnc.sh | bash
```

<details>
<summary><b>Manual steps</b></summary>

```bash
sudo apt install -y tigervnc-standalone-server
vncpasswd                      # set your VNC password (6–8 characters)
vncserver :1 -localhost no -geometry 1280x720
```

`-localhost no` is required — without it the VNC server only accepts connections from the Pi itself, and KeX won't be able to connect.
</details>

## 7. Connect with NetHunter KeX

Open **NetHunter KeX** and enter:

| Field | Value |
|-------|-------|
| Connection type | `Basic VNC` |
| VNC server | `PI_IP_ADDRESS` |
| Port | `5901` |
| Password | The VNC password you set |

Tap **Connect** — you should see the Kali Xfce desktop. 🎉

---

➡️ Something not working? Check the [Troubleshooting guide](troubleshooting.md).
