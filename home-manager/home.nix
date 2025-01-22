{ config, pkgs, ... }:
{
  imports =
    [
      ./pkgs/lact.nix
      ./pkgs/steam.nix
      ./pkgs/zsh.nix
      ./systemd/caddy-steam.nix
    ];
  home.username = "Frb";
  home.homeDirectory = "/home/Frb";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    yazi
    fastfetch
    zip unzip p7zip
    vscode
    libreoffice-qt6-fresh
    microsoft-edge
    motrix
    thunderbird
    qq
    wechat-uos
    netease-cloud-music-gtk
  ];
}
