{ config, lib, pkgs, ... }:
{
  fileSystems = {
    "/".options = [ "subvol=@root" "noatime" "autodefrag" "compress=zstd:15" ];
    "/nix".options = [ "subvol=@nix" "noatime" "autodefrag" "compress=zstd:15" ];
    "/nix/store".options = [ "subvol=@nix/store" "noatime" "autodefrag" "compress=zstd:15" ];
    "/nix/var".options = [ "subvol=@nix/var" "noatime" "autodefrag" "compress=zstd:15" ];
    "/home".options = [ "subvol=@home" "noatime" "autodefrag" "compress=zstd:15" ];
    "/swap".options = [ "subvol=@swap" "noatime" "autodefrag" "compress=zstd:15" ];
    "/data".options = [ "subvol=@data" "noacl" "noatime" "autodefrag" "compress=zstd:15" ];
    "/efi".options = [ "fmask=0022" "dmask=0022" ];
  };
  swapDevices = [{
    device = "/swap/swapfile";
    size = 64*1024;
  }];
  boot.kernelParams = ["resume_offset=533760"];
  boot.resumeDevice = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" "/data" ];
  };
}
