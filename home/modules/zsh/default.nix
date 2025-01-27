{ config, pkgs, lib, opt-config, ... }:
{
  home.Packages = with pkgs; [
    zsh
    zimfw
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    programs.zsh.dotDir = ".config/zsh";
    plugins = [
      {
        name = "zimfw";
        src = pkgs.zimfw;
      }
    ];
  };
}