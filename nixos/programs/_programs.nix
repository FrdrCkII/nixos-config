{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./caddy-steam.nix
      ./lact.nix
      ./steam.nix
      ./zsh.nix
    ];
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    yazi
    fastfetch

    unzip
    unrar
    p7zip
  ];
}
