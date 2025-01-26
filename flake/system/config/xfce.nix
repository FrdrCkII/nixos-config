{ config, lib, pkgs, ... }:
{
  services.xserver.desktopManager.xfce = {
    enable = true;
    # enableXfwm = true;
    # enableScreensaver = true;
    # noDesktop = true;
  };
}
