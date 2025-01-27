# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
      fsType = "btrfs";
      options = [ "subvol=@root" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/nix/store" =
    { device = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
      fsType = "btrfs";
      options = [ "subvol=@nix/store" ];
    };

  fileSystems."/nix/var" =
    { device = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
      fsType = "btrfs";
      options = [ "subvol=@nix/var" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/87D2-B5F7";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/data" =
    { device = "/dev/disk/by-uuid/8bdbb302-76d7-40b7-8360-13fc04923381";
      fsType = "btrfs";
      options = [ "subvol=@data" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
