# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./hardware-configuration.nix
      ./programs/_programs.nix
      ./config/boot.nix
      ./config/hardware.nix
      ./config/i18n.nix
      ./config/nix.nix
      ./desktop/kde.nix
    ];
  users.users.Frb = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.hostName = "Frbspc";
  system = {
    stateVersion = "unstable";
    autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
  };
}
