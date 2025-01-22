{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./input/fcitx5.nix
      ./services/sddm.nix
    ];
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
  ];
}
