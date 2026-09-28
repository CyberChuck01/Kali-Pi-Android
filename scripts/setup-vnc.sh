#!/usr/bin/env bash
# ------------------------------------------------------------
#  Kali-Pi-Android :: setup-vnc.sh
#  Installs TigerVNC on Kali (Pi Zero 2 W) and starts a VNC
#  session that NetHunter KeX can connect to on port 5901.
#
#  https://github.com/CyberChuck01/Kali-Pi-Android
# ------------------------------------------------------------
set -euo pipefail

DISPLAY_NUM="${DISPLAY_NUM:-1}"
GEOMETRY="${GEOMETRY:-1280x720}"
PORT=$((5900 + DISPLAY_NUM))

green() { printf '\033[1;32m[+]\033[0m %s\n' "$*"; }
yellow() { printf '\033[1;33m[!]\033[0m %s\n' "$*"; }

if [[ $EUID -eq 0 ]]; then
  yellow "Run this as your normal user (kali), not root. It will ask for sudo when needed."
  exit 1
fi

if ! command -v vncserver >/dev/null 2>&1; then
  green "Installing TigerVNC server..."
  sudo apt-get update
  sudo apt-get install -y tigervnc-standalone-server
else
  green "TigerVNC already installed."
fi

if [[ ! -f "$HOME/.vnc/passwd" && ! -f "$HOME/.config/tigervnc/passwd" ]]; then
  green "Set a VNC password (6-8 characters). Answer 'n' to the view-only question."
  vncpasswd < /dev/tty
fi

# Stop any existing session on this display
vncserver -kill ":${DISPLAY_NUM}" >/dev/null 2>&1 || true

green "Starting VNC on display :${DISPLAY_NUM} (${GEOMETRY})..."
vncserver ":${DISPLAY_NUM}" -localhost no -geometry "${GEOMETRY}" -xstartup /usr/bin/startxfce4

IP_ADDR="$(hostname -I | awk '{print $1}')"

echo
green "Done! Open NetHunter KeX and connect with:"
echo "      Connection type : Basic VNC"
echo "      VNC server      : ${IP_ADDR}"
echo "      Port            : ${PORT}"
echo "      Password        : (the VNC password you set)"
echo
yellow "Stop the session with:  vncserver -kill :${DISPLAY_NUM}"
