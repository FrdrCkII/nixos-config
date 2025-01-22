{ config, lib, pkgs, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };
    firewall.enable = false;
  };
}
