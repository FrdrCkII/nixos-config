{ config, pkgs, lib, opt-config, ... }:
{
  home.packages = with pkgs; [
    zsh
    zimfw
  ];
  home.file.".config/zsh/.zimrc".source = ./zimrc;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    plugins = [
      {
        name = "zimfw";
        src = pkgs.zimfw;
      }
    ];
    initExtra = [
      "ZIM_CONFIG_FILE=~/.config/zsh/.zimrc"
      "ZIM_HOME=~/.zim"
    ];
  };
}