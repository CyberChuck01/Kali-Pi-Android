<div align="center">

# 🐉 Kali-Pi-Android

**Run a full Kali Linux desktop on a Raspberry Pi Zero 2 W — and control it from your Android phone.**

[![Kali Linux](https://img.shields.io/badge/Kali_Linux-2025.x-557C94?style=for-the-badge&logo=kalilinux&logoColor=white)](https://www.kali.org/get-kali/#kali-arm)
[![Raspberry Pi](https://img.shields.io/badge/Raspberry_Pi-Zero_2_W-C51A4A?style=for-the-badge&logo=raspberrypi&logoColor=white)](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/)
[![Android](https://img.shields.io/badge/Android-Termux_%2B_KeX-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://store.nethunter.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

[![YouTube](https://img.shields.io/badge/YouTube-cyberchuck01-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/@cyberchuck01)
![GitHub stars](https://img.shields.io/github/stars/CyberChuck01/Kali-Pi-Android?style=flat-square)
![Last commit](https://img.shields.io/github/last-commit/CyberChuck01/Kali-Pi-Android?style=flat-square)

<!-- Add a photo of your rig here: -->
<!-- <img src="assets/demo.jpg" alt="Kali desktop on Android via Pi Zero 2 W" width="600"> -->

</div>

---

## 📖 Overview

**Kali-Pi-Android** turns a ~$15 Raspberry Pi Zero 2 W into a pocket-sized Kali Linux box that you drive entirely from your Android phone. The phone's hotspot provides the network, **Termux** gives you an SSH terminal, and **NetHunter KeX** gives you the full graphical desktop over VNC. No root required on the phone.

```
┌──────────────────┐   Wi-Fi hotspot    ┌───────────────────────┐
│  Android phone   │◄──────────────────►│  Raspberry Pi Zero 2 W │
│                  │                    │                        │
│  Termux ── SSH ──┼───── port 22 ─────►│  Kali Linux (headless) │
│  KeX    ── VNC ──┼───── port 5901 ───►│  TigerVNC + Xfce       │
└──────────────────┘                    └───────────────────────┘
```

## ✨ Features

- 🐉 Full Kali Linux desktop in your pocket
- 📱 Controlled from any Android phone — no root needed
- 🔌 Headless setup — no monitor, keyboard, or mini-HDMI adapter required
- 📶 Runs entirely off your phone's hotspot
- 🧭 Two setup paths: **phone only**, or **computer assisted** (saves hotspot data)

## 🧰 Requirements

### Hardware

| Item | Notes |
|------|-------|
| Raspberry Pi Zero 2 W | Must be the **2 W** (quad-core, 64-bit) |
| microSD card | 8 GB minimum, 32 GB+ recommended (tested on 64 GB) |
| Micro-USB cable | Must be a **data** cable, not charge-only |
| Android phone | Android 7+ with mobile hotspot |
| Computer | Windows, macOS, or Linux — for flashing the SD card |

### Software

| Where | Software | Purpose |
|-------|----------|---------|
| Computer | [Raspberry Pi Imager](https://www.raspberrypi.com/software/) | Flash Kali to the SD card |
| Computer | [PuTTY](https://www.putty.org/) *(Windows, optional)* | SSH client for the computer-assisted method |
| Phone | [NetHunter Store](https://store.nethunter.com/) | Source for the apps below |
| Phone | Termux | SSH terminal |
| Phone | NetHunter KeX | VNC client for the desktop |

### Kali image

Download the **Raspberry Pi Zero 2 W (64-bit)** image from the official Kali ARM page:
👉 **https://www.kali.org/get-kali/#kali-arm**

> [!WARNING]
> Do **not** use the *Pi-Tail* image, and do **not** use the original *Raspberry Pi Zero W* (armel) image — that one is built for the older single-core Zero W.

## 🚀 Quick Start

Pick a setup path:

| Guide | Best for | Hotspot data used |
|-------|----------|-------------------|
| 📱 [**Phone Only Setup**](docs/phone-only-setup.md) | No home Wi-Fi, or you want the simplest path | ~1.3 GB (system upgrade runs over hotspot) |
| 💻 [**Computer Assisted Setup**](docs/computer-assisted-setup.md) | You have home Wi-Fi and want to save mobile data | Minimal |

The short version:

1. Flash Kali to the SD card with Raspberry Pi Imager and enable SSH + Wi-Fi.
2. Boot the Pi and find its IP address.
3. SSH in from Termux.
4. Run [`scripts/setup-vnc.sh`](scripts/setup-vnc.sh) to install and start the VNC server.
5. Connect with NetHunter KeX → `PI_IP_ADDRESS:5901`.

## 🔐 Security Notes

> [!IMPORTANT]
> This project uses Kali's well-known default credentials (`kali` / `kali`) during setup. **Change them immediately** after your first login:
> ```bash
> passwd          # change the user password
> vncpasswd       # change the VNC password
> ```
> Anyone on the same network who knows the defaults can take over your Pi.

## 🛠️ Troubleshooting

Having trouble? See [**docs/troubleshooting.md**](docs/troubleshooting.md) for fixes to common problems like the Pi not showing up on the hotspot, VNC refusing connections, or a black screen in KeX.

## 🗺️ Roadmap

- [ ] One-command setup script
- [ ] USB gadget (OTG) mode — connect over the USB cable, no Wi-Fi needed
- [ ] Auto-start VNC on boot (systemd service)
- [ ] Photos and demo video

## 🤝 Contributing

Contributions, bug reports, and tested-on reports for other phones are welcome! Read [CONTRIBUTING.md](CONTRIBUTING.md) to get started.

## ⚖️ Legal Disclaimer

This project is for **educational purposes and authorized security testing only**. Only use Kali Linux tools on networks and devices you own or have explicit written permission to test. The author is not responsible for misuse.

## 📄 License

Released under the [MIT License](LICENSE).

---

<div align="center">

Made by **[CyberChuck01](https://github.com/CyberChuck01)** · Watch the build on **[YouTube](https://www.youtube.com/@cyberchuck01)**

⭐ If this helped you, consider giving the repo a star!

</div>
