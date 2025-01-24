{ config, pkgs, username, ... }:
{
  imports = [
    ./modules
  ];
  programs.home-manager.enable = true;
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
    packages = with pkgs; [
      yazi fastfetch
      zip unzip p7zip
      lact zsh
      vscode
      microsoft-edge
      thunderbird
      motrix
    ];
  };
}
