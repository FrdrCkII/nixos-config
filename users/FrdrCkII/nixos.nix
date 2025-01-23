{ config, lib, pkgs, username, ... }:
{
  imports = [
    ../system/system.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}