{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run
    gamescope
    mangohud
    proton-ge-bin
  ];
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      protontricks.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
  hardware = {
    steam-hardware.enable = true;
    xone.enable = true;
  };
}
