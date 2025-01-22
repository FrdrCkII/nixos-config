{ config, pkgs, lib, ... }:
{
  environment.packages = with pkgs; [
    steam-run
    gamescope
    mangohud
  ];
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
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
