{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/kde.nix
    ./config/nix.nix
  ];
  environment.systemPackages = with pkgs; [ vim wget git ];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.hostName = "FrdrCkII";
  users.users.FrdrCkII = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
  system = {
    stateVersion = "unstable";
    autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
  };
}
