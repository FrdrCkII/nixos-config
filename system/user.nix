{ config, lib, nixpkgs-unstable, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}