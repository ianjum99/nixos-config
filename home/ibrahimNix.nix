{ config, pkgs, ... }:

{
  home.username = "yourUsername";
  home.homeDirectory = "/home/yourUsername";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    brave
    discord
    wineWowPackages.stable
    winetricks
    steam
    steam-run
    lutris
    kitty
    fzf
    zsh
    rofi-wayland
    waybar
    lxappearance
    qt5ct
  ];

  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.home-manager.enable = true;

  xdg.configFile."hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
  xdg.configFile."rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
  xdg.configFile."waybar/style.css".source = ./dotfiles/waybar/style.css;

  gtk = {
    enable = true;
    theme.name = "Catppuccin-Mocha-Standard-Blue-Dark";
    iconTheme.name = "Papirus-Dark";
    cursorTheme.name = "Catppuccin-Mocha-Dark-Cursors";
  };
}
