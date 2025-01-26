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
