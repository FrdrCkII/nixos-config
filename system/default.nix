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
}:
{
  imports = [
    ../hosts/${hostname}/hardware-configuration.nix
    ../hosts/${hostname}/filesystem.nix
    ../hosts/${hostname}/system.nix
    ./packages.nix
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/nix.nix
    ./modules/caddy.nix
    ./modules/clash.nix
    ./modules/docker.nix
    ./modules/steam.nix
    ./modules/lact.nix
    ./modules/zsh.nix
    ./modules/fhs.nix
  ]++
  lib.optionals (builtins.elem "nvidia" opt-config.gpu-type) [
    ./modules/nvidia.nix
  ]++
  lib.optionals (builtins.elem "amd" opt-config.gpu-type) [
    ./modules/amd.nix
  ]++
  lib.optionals (builtins.elem "kde" opt-config.desktop) [
    ./desktop/kde
  ];
  nixpkgs.config = {
    allowUnfreePredicate = allowed-unfree-packages;
    permittedInsecurePackages = allowed-insecure-packages;
  };
  networking.networkmanager.enable = true;
  networking.hostName = "${hostname}";
}
