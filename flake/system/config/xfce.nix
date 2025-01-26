{ config, lib, pkgs, ... }:
{
  services.xserver.desktopManager.xfce = {
    enable = true;
    enableXfwm = true;
    enableScreensaver = true;
    # noDesktop = true;
  };
  environment.xfce.excludePackages = with pkgs.xfce; [
    
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
