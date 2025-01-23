{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./programs/nginx.nix
    ./config/boot.nix
    ./config/filesystem.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/kde.nix
    ./config/nix.nix
  ];
  environment.systemPackages = with pkgs; [ vim wget git ];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.hostName = "FrdrCkII";
  system.stateVersion = "unstable";
  system.autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
}
