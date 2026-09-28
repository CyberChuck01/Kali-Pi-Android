# 💻 Computer Assisted Setup

Use this method to save mobile data. The Pi first joins your **home Wi-Fi**, where you run the big system upgrade from your computer. Then you add your phone's hotspot and switch over.

**Contents**
1. [Flash the SD card](#1-flash-the-sd-card)
2. [Boot the Pi on home Wi-Fi](#2-boot-the-pi-on-home-wi-fi)
3. [SSH in from your computer](#3-ssh-in-from-your-computer)
4. [Update Kali and install VNC](#4-update-kali-and-install-vnc)
5. [Add your phone hotspot](#5-add-your-phone-hotspot)
6. [Install the Android apps](#6-install-the-android-apps)
7. [Connect from your phone](#7-connect-from-your-phone)

---

## 1. Flash the SD card

1. Download and open **[Raspberry Pi Imager](https://www.raspberrypi.com/software/)**.
   On Windows, also install **[PuTTY](https://www.putty.org/)** (macOS and Linux can use the built-in `ssh` command).
2. **Choose Device** → `Raspberry Pi Zero 2 W`
3. **Choose OS** → `Other specific-purpose OS` → `Kali Linux` → `Raspberry Pi Zero 2 W`
   > ⚠️ Not the *Pi-Tail* image.
4. **Choose Storage** → your microSD card.
5. Click **Next** → **Edit Settings** and fill in:

   | Setting | Value |
   |---------|-------|
   | Username / password | `kali` / `kali` *(change after first login)* |
   | Wireless LAN | Your **home Wi-Fi** SSID and password |
   | Wireless LAN country | Your country |
   | Locale | Your timezone and keyboard layout |
   | **Services** tab | ✅ Enable SSH (password authentication) |

6. Click **Save** → **Yes** to apply the custom settings, then write the card.

## 2. Boot the Pi on home Wi-Fi

1. Insert the SD card into the Pi Zero 2 W.
2. Plug the micro-USB cable into the **PWR IN** port (the right-most micro-USB port, with the SD slot on your left).
3. Wait ~5 minutes for the first boot.
4. Log in to your router's admin page, open the list of connected devices, and find `kali-raspberry-pi-zero-2-w`. Note its **IP address**.

## 3. SSH in from your computer

**Windows (PuTTY):** Host Name = `PI_IP_ADDRESS`, Port = `22`, click **Open**, then log in as `kali`.

**macOS / Linux:**
```bash
ssh kali@PI_IP_ADDRESS
```

Password: `kali` (nothing appears while typing — that's normal). Then change it right away:

```bash
passwd
```

## 4. Update Kali and install VNC

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y tigervnc-standalone-server
vncpasswd        # set your VNC password (6–8 characters)
```

This all runs over your home internet, so it won't touch your mobile data.

## 5. Add your phone hotspot

Turn on your phone's hotspot, then on the Pi scan for it and save it as a connection:

```bash
nmcli device wifi list
sudo nmcli device wifi connect "HOTSPOT_NAME" password "HOTSPOT_PASSWORD"
```

> [!WARNING]
> As soon as the Pi switches to the hotspot, your SSH session from the computer **will disconnect**. That's expected — you'll reconnect from your phone next.

The Pi keeps both networks saved. To make it prefer the hotspot on future boots, you can raise its priority:

```bash
sudo nmcli connection modify "HOTSPOT_NAME" connection.autoconnect-priority 10
```

## 6. Install the Android apps

1. *(If your phone requires it)* enable Developer Options: **Settings → About phone → Software information** → tap **Build number** ~7 times.
2. Go to **[store.nethunter.com](https://store.nethunter.com/)** in your browser and install the NetHunter Store app (allow your browser to **install unknown apps** when prompted).
3. In the NetHunter Store, tap 🔍 and install **Termux** (v0.118.0 tested) and **NetHunter KeX**.

## 7. Connect from your phone

1. Open your hotspot settings, tap the Pi in the connected devices list, and note its new **IP address** (it will be different from the home Wi-Fi one).
2. Open **Termux**:

   ```bash
   pkg update && pkg upgrade -y
   pkg install openssh -y
   ssh kali@PI_IP_ADDRESS
   ```

3. Start the VNC server:

   ```bash
   vncserver :1 -localhost no -geometry 1280x720
   ```

4. Open **NetHunter KeX** and connect:

   | Field | Value |
   |-------|-------|
   | Connection type | `Basic VNC` |
   | VNC server | `PI_IP_ADDRESS` |
   | Port | `5901` |
   | Password | Your VNC password |

You should see the Kali Xfce desktop. 🎉

---

➡️ Something not working? Check the [Troubleshooting guide](troubleshooting.md).
