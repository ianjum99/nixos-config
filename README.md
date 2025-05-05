# 🛠️ NixOS Dev + Gaming Setup with Hyprland & Flakes

A complete NixOS config using flakes and Home Manager, optimized for both development and gaming:

- Tiling WM: Hyprland + Catppuccin Mocha
- IDEs: VSCode, Cursor
- Languages: Java, C/C++, Python, Go, Node.js
- Cloud SDKs: AWS, Docker, Terraform
- Gaming: Wine, Steam, Lutris, Flatpak
- Theming: GTK, QT, Rofi, Waybar
- GPU: NVIDIA 3070 support
- Flakes + Home Manager structure

---

## 🔧 Setup Instructions

### 1. Boot into NixOS ISO & Partition Drives
Refer to earlier instructions for creating:
- `/dev/nvme0n1`: EFI + root (btrfs)
- `/dev/sda1`: `/home`
- `/dev/sdb1`: `/media`

Mount them under `/mnt` accordingly.

---

### 2. Enable flakes and clone this repo
```bash
nix-shell -p git nixFlakes
git clone https://github.com/ianjum99/nixos-config /mnt/etc/nixos
cd /mnt/etc/nixos
```

---

### 3. Generate hardware config
```bash
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix hosts/
```

---

### 4. Install NixOS
```bash
nixos-install --flake .#nixos
passwd
reboot
```

---

### 5. Post-Reboot
```bash
home-manager switch
```

---

### 6. Optional Post-Install
```bash
# Wine
WINEPREFIX=~/.wine64 winecfg
WINEPREFIX=~/.wine32 WINEARCH=win32 winecfg

# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.lutris.Lutris
```

---

## 📦 Installed Dev Packages
- `jdk`, `maven`, `gradle`
- `clang`, `gcc`, `gdb`, `cmake`
- `python3`, `pip`, `virtualenv`
- `go`
- `nodejs`, `npm`, `yarn`
- `awscli2`, `terraform`, `docker`, `docker-compose`
- `vscode`, `cursor`

---

## 📂 Structure

```
nixos-config/
├── flake.nix
├── README.md
├── home/
│   └── ibrahim-nix.nix
├── dotfiles/
│   ├── hyprland.conf
│   ├── rofi/
│   │   └── config.rasi
│   └── waybar/
│       └── style.css
```

MIT Licensed. Open to PRs for improvements.

---

## 🌤 Waybar Configuration (Clock + Weather + System Info)

Waybar includes:
- Weather widget (via OpenWeatherMap)
- System clock with calendar tooltip
- CPU, Memory, Network, Volume, and System Tray
- Styled with Catppuccin Mocha

To enable weather:

1. Get an OpenWeatherMap API key: https://openweathermap.org/api
2. Replace `"YOUR_API_KEY"` in `dotfiles/waybar/config` with your real key.

Waybar config path (linked via Home Manager):
- `dotfiles/waybar/config`
- `dotfiles/waybar/style.css`

Modules shown:
- `hyprland/workspaces`
- `clock`
- `weather`
- `cpu`, `memory`, `network`, `pulseaudio`, `tray`
