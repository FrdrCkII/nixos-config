{ config, lib, pkgs, ... }:
{
  system.stateVersion = "unstable";
  system.autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
