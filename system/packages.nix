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
  system-packages = with pkgs; [
    vim wget git
  ]
  ++ opt-config.SystemPackages;
in {
  environment.systemPackages = system-packages;
}