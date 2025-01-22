{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./input/fcitx5.nix
      ./services/networkmanager.nix
      ./services/sddm.nix
    ];
  environment.systemPackages = with pkgs; [
    kdePackages.sddm-kcm
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
  ];
  services.desktopManager.plasma6.enable = true;
  i18n.inputMethod.fcitx5.plasma6Support = true;
  qt.platformTheme = "kde";
  qt.style = "kvantum";
  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    chromium = {
      enablePlasmaBrowserIntegration = true;
    };
  };
}