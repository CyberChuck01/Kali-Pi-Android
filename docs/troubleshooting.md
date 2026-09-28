# 🛠️ Troubleshooting

### The Pi never shows up on my hotspot
- Give it time — the first boot can take 5–10 minutes.
- Make sure you flashed the **Zero 2 W** image, not the original Zero W or Pi-Tail image.
- Many phones default to a **5 GHz** hotspot. The Pi Zero 2 W only supports **2.4 GHz**. Look for a setting like *Band* or *Maximize compatibility* and switch it to 2.4 GHz.
- Double-check the SSID and password you typed in Raspberry Pi Imager — they are case-sensitive.
- Try a different power source. A weak charger can cause the Pi to brown-out during boot.

### My hotspot shows the device but not its IP address
Some Android skins only show device names. Options:
- Try the other setup path and find the IP from your router instead.
- Install a network scanner app (e.g. Fing) and scan the hotspot network.

### `ssh: connect to host ... Connection refused`
- SSH wasn't enabled in Raspberry Pi Imager. Re-flash with **Services → Enable SSH** checked.
- The Pi may still be booting — wait a minute and retry.

### `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`
This happens after re-flashing the SD card. In Termux, clear the old key:
```bash
ssh-keygen -R PI_IP_ADDRESS
```

### KeX says "Connection refused" on port 5901
- The VNC server isn't running. SSH in and run:
  ```bash
  vncserver -list
  ```
- If it's running but still refuses, it was probably started **without** `-localhost no`. Restart it:
  ```bash
  vncserver -kill :1
  vncserver :1 -localhost no -geometry 1280x720
  ```

### KeX connects but shows a black or grey screen
Restart the VNC session with the Xfce desktop explicitly:
```bash
vncserver -kill :1
vncserver :1 -localhost no -geometry 1280x720 -xstartup /usr/bin/startxfce4
```

### `kex: command not found`
`kex` is a NetHunter command that only exists on phones running NetHunter itself. On the Pi, use `vncserver` instead.

### The desktop is really slow
The Zero 2 W has 512 MB of RAM, so a full desktop is tight. Tips:
- Use a smaller resolution: `-geometry 1024x576`
- Add swap:
  ```bash
  sudo fallocate -l 1G /swapfile && sudo chmod 600 /swapfile
  sudo mkswap /swapfile && sudo swapon /swapfile
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
  ```
- Close apps you're not using — many Kali tools run fine from the Termux terminal without the desktop.

---

Still stuck? [Open an issue](https://github.com/CyberChuck01/Kali-Pi-Android/issues/new/choose) and include your phone model, which guide you followed, and the exact error message.
