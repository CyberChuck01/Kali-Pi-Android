# 🤝 Contributing to Kali-Pi-Android

Thanks for helping out! This project is small, so every contribution matters.

## Ways to help
- **Report a bug** — something in the guide didn't work? [Open a bug report](https://github.com/CyberChuck01/Kali-Pi-Android/issues/new/choose).
- **Tested-on reports** — let us know which phone and Kali version you used successfully.
- **Improve the docs** — typos, clearer steps, screenshots.
- **Add features** — scripts, USB gadget mode, auto-start on boot, etc.

## Making a change
1. Fork the repo and create a branch: `git checkout -b fix/my-change`
2. Make your changes and test them on real hardware if possible.
3. Commit with a clear message: `git commit -m "docs: clarify hotspot band setting"`
4. Push and open a Pull Request describing what you changed and why.

## Guidelines
- Keep guides beginner-friendly — explain *why*, not just *what*.
- Use `PI_IP_ADDRESS` as the placeholder for IP addresses.
- Shell scripts should pass `bash -n` and ideally [ShellCheck](https://www.shellcheck.net/).
- Never commit real passwords, SSIDs, or IP addresses from your own network.

## Code of conduct
Be respectful and helpful. This project is for learning and authorized testing only — contributions that encourage illegal use will be rejected.
