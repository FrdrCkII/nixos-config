{ config, lib, pkgs, ... }:
{
  imports = [
    .../system/system.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}