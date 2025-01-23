{ config, nixpkgs-unstable, ... }:
{
  home.username = "Frb";
  home.homeDirectory = "/home/Frb";
  home.stateVersion = "25.05";
  home.packages = with nixpkgs-unstable; [
    yazi fastfetch
    zip unzip p7zip
    vscode
    microsoft-edge
    thunderbird
    motrix
  ];
}