{ config, lib, pkgs, nixpkgs-unstable, ... }:
{
  imports = [
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/nix.nix
  ];
  environment.systemPackages = with nixpkgs-unstable; [ vim wget git ];
  boot.kernelPackages = nixpkgs-unstable.linuxPackages_zen;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.hostName = "FrdrCkII";
  system.stateVersion = "unstable";
  system.autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
}
