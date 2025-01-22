{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    # userName = "FrdrCkII";
    # userEmail = "c2h5oc2h4@outlook.com";
  };
  users.users.Frb = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
