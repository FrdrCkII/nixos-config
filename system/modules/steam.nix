{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
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
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      protontricks.enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils

          # fix CJK fonts
          source-sans
          source-serif
          source-han-sans
          source-han-serif

          # audio
          pipewire

          # other common
          udev
          alsa-lib
          vulkan-loader
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          xorg.libXrandr # To use the x11 feature
          libxkbcommon
          wayland # To use the wayland feature
        ];
      };
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
  fonts.packages = with pkgs; [
    wqy_zenhei # Need by steam for Chinese
  ];
}
