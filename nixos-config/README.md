# NixOS Hyprland Gaming Setup (Flake + Home Manager)

This setup provides a full NixOS configuration for a modern gaming/development system using:
- Hyprland window manager
- Catppuccin Mocha theming
- Wine (32/64-bit) + Steam + Lutris + Flatpak
- NVIDIA 3070 GPU support
- Home Manager integration
- GitHub-ready config

## Features

- Declarative system with flakes
- Clean theming via Home Manager (Waybar, Rofi, GTK)
- Multi-drive support (`/home`, `/media`)
- Git-managed configuration

## Structure

```
nixos-config/
├── flake.nix
├── flake.lock
├── hosts/
│   ├── default.nix
│   └── hardware-configuration.nix
├── home/
│   └── yourUsername.nix
├── users/
│   └── yourUsername.nix
├── dotfiles/
│   ├── hyprland.conf
│   ├── rofi/
│   │   └── config.rasi
│   └── waybar/
│       └── style.css
```

## Setup

### 1. Clone Repo

```bash
git clone https://github.com/YOUR_USERNAME/nixos-config /etc/nixos
cd /etc/nixos
```

### 2. Install NixOS

```bash
nixos-install --flake .#nixos
```

### 3. Reboot & Login

Run:

```bash
home-manager switch
```

## Optional Post-Install

```bash
# Setup Wine prefixes
WINEPREFIX=~/.wine64 winecfg
WINEPREFIX=~/.wine32 WINEARCH=win32 winecfg

# Setup Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.lutris.Lutris
```

Enjoy your fully themed NixOS system.
