{ config, lib, pkgs, ... }:
{
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATIOON = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      font-awesome
      sarasa-gothic
      twemoji-color-font
    ];
    fontconfig.defaultFonts = {
      serif = [ "Sarasa Gothic Sc regular" ];
      sansSerif = [ "Sarasa Gothic Sc regular" ];
      monospace = [ "Sarasa Mono SC" ];
      emoji = [ "Twitter Color Emoji Regular" ];
    };
  };

  console = {
    enable = true;
    font = "Noto Serif CJK SC";
    useXkbConfig = true;
  };
}
