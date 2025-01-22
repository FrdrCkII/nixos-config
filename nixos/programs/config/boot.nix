{ config, lib, pkgs, ... }:
{
  boot = {
    enableContainers = false;
    supportedFilesystems = [ "btrfs" "vfat" "ntfs" ];
    loader = {
      efi = {
        efiSysMountPoint = "/efi";
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        # enable = lib.mkDefault true;
        enable = false;
        configurationLimit = 3;
        consoleMode = "max";
      };
      grub = {
        enable = true;
        configurationName = "NixOS";
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        gfxmodeEfi = "1366x768";
      };
    };
    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };
}
