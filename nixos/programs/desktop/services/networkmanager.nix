{ config, lib, pkgs, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      # wifi.backend = lib.mkForce "iwd";
    };
    firewall.enable = false;
  };
}
