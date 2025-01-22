{ config, lib, pkgs, ... }:
{
  systemd.services = {
    create-swapfile = {
      serviceConfig.Type = "oneshot";
      wantedBy = [ "swap-swapfile.swap" ];
      script = ''
        swapfile="/swap/swapfile"
        if [[ -f "$swapfile" ]]; then
          echo "Swap file $swapfile already exists, taking no action"
        else
          echo "Setting up swap file $swapfile"
          ${pkgs.coreutils}/bin/truncate -s 0 "$swapfile"
        fi
        ${pkgs.e2fsprogs}/bin/chattr +C "$swapfile"
        ${pkgs.e2fsprogs}/bin/chattr +C "/var/log"
        ${pkgs.e2fsprogs}/bin/chattr +C "/var/cache"
        ${pkgs.e2fsprogs}/bin/chattr +C "/var/tmp"
      '';
    };
  };
  boot.kernelParams = ["resume_offset=533760"];
  boot.resumeDevice = "/dev/disk/by-uuid/60417b11-7d0f-4bc7-a3c1-b4ffc5f10d57";
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" "/data" ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mesa
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        mesa
      ];
    };
  };
}
