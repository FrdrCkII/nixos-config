{ config, lib, pkgs, ... }:
{
  fileSystems = {
    "/".options = [ "noatime" "autodefrag" "compress=zstd:15" ];
    "/nix".options = [ "noatime" "autodefrag" "compress=zstd:15" ];
    "/nix/store".options = [ "noatime" "autodefrag" "compress=zstd:15" ];
    "/nix/var".options = [ "noatime" "autodefrag" "compress=zstd:15" ];
    "/home".options = [ "noatime" "autodefrag" "compress=zstd:15" ];
    "/swap".options = [ "noatime" "autodefrag" "compress=zstd:15" ];
    "/data".options = [ "noacl" "noatime" "autodefrag" "compress=zstd:15" ];
  };
  swapDevices = [{
    device = "/swap/swapfile";
    size = 64*1024;
  }];
  boot.kernelParams = ["resume_offset=533760"];
  boot.resumeDevice = "/dev/disk/by-uuid/f1699d4d-76df-4078-b6f6-5200d134bf87";
  boot.loader.efi.efiSysMountPoint = lib.mkForce "/efi";
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" "/data" ];
  };
}
