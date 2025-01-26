{
  lib,
  pkgs,
  config,
  allowed-unfree-packages,
  allowed-insecure-packages,
  opt-config,
  hostname,
  options,
  ...
}: let 
  home-packages = with pkgs;[
    nur.repos.novel2430.wemeet-bin-bwrap-wayland-screenshare
    nur.repos.novel2430.wechat-universal-bwrap
    nur.repos.xddxdd.baidunetdisk
    nur.repos.xddxdd.dingtalk
    nur.repos.xddxdd.qq
  ]
  ++ opt-config.HomePackages;
in {
  programs.home-manager.enable = true;
  home = {
    username = "${opt-config.username}";
    homeDirectory = "/home/${opt-config.username}";
    stateVersion = "25.05";
    packages = home-packages;
  };
}
