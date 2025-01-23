{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    .../system/system.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}