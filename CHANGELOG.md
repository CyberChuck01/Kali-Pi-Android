# Changelog

All notable changes to this project are documented here.

## [1.0.0] - 2026-09-28
### Added
- Professional README with badges, architecture diagram, and requirements tables
- Separate guides: Phone Only Setup and Computer Assisted Setup
- Troubleshooting guide
- `scripts/setup-vnc.sh` helper script
- LICENSE, CONTRIBUTING, and issue templates

### Fixed
- Kali image link now points to the Pi Zero 2 W (64-bit) image instead of the original Zero W (armel) image
- VNC server now started with `-localhost no` so KeX can connect remotely
- Removed `kex start` step (NetHunter-only command, not available on the Pi)
- Added TigerVNC install step
- Added security notes about changing default passwords

## [0.1.0] - Initial release
- Original setup notes (`Process`)
