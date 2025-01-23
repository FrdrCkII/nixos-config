{ config, lib, nixpkgs-unstable, ... }:
{
  imports = [
    .../system/system.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}