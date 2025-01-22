# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./hardware-configuration.nix
      ./config/boot.nix
      ./config/hardware.nix
      ./config/i18n.nix
      ./config/nix.nix
      ./desktop/kde.nix
    ];
  environment.systemPackages = with pkgs; [ vim wget git ];
  environment.variables.EDITOR = "vim";
  boot.kernelPackages = pkgs.linuxPackages_zen;
  programs.git = {
    enable = true;
    # userName = "FrdrCkII";
    # userEmail = "c2h5oc2h4@outlook.com";
  };
  networking = {
    hostName = "Frbspc";
    networkmanager.enable = true;
    firewall.enable = true;
  };
  users.users.Frb = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
  system = {
    stateVersion = "unstable";
    autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
  };
}
