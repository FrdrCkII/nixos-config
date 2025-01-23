{ config, pkgs, inputs, ... }:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    yazi fastfetch
    zip unzip p7zip
    vscode
    microsoft-edge
    thunderbird
    motrix
  ];
}