{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
    packages = with pkgs; [
      yazi fastfetch
      zip unzip p7zip
      vscode
      microsoft-edge
      thunderbird
      motrix
    ];
  };
}
