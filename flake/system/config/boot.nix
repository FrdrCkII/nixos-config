{ config, lib, pkgs, ... }:
{
  boot = {
    enableContainers = false;
    supportedFilesystems = {
      btrfs = true;
      zfs = lib.mkForce false;
    };
    loader = {
      efi.efiSysMountPoint = "/efi";
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "1366x768";
        configurationName = "NixOS";
      };
    };
  };
}
