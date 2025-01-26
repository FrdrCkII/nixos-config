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
  programs.home-manager.enable = true;
  home = {
    username = "${opt-config.username}";
    homeDirectory = "/home/${opt-config.username}";
    stateVersion = "25.05";
    packages = with pkgs; [
      lact zsh
      vscode
      microsoft-edge
      thunderbird
      motrix
    ];
  };
}
