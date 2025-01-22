{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./input/fcitx5.nix
      ./services/networkmanager.nix
    ];

  services = {
    xserver = {
      enable = true;
      desktopManager.lxqt.enable = true;
    };
  };
}

