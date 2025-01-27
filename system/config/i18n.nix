{ config, lib, pkgs, ... }:
{
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
  ];
  i18n.extraLocaleSettings = {
    LC_CTYPE = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
    LC_COLLATE = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_MESSAGES = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_ALL = "zh_CN.UTF-8";
  };
  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      material-design-icons
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
  console.font = "Lat2-Terminus16";
}
