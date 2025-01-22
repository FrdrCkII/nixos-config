{ config, pkgs, ... }:
{
  home.username = "Frb";
  home.homeDirectory = "/home/Frb";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
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
