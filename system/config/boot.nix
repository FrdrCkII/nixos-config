{ config, lib, pkgs, ... }:
{
  boot = {
    enableContainers = false;
    supportedFilesystems = [ "btrfs" "vfat" ];
    loader = {
      efi.efiSysMountPoint = "/efi";
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false;
      grub = {
        enable = true;
        configurationName = "NixOS";
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "1366x768";
      };
    };
  };
}
