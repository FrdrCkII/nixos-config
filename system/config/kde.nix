{ config, lib, pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate okular elisa oxygen gwenview
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime fcitx5-mozc
      ];
    };
  };
}
