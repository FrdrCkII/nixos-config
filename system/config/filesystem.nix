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
  swapDevices = [{ device = "/swap/swapfile"; }];
}
