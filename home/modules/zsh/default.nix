{ config, pkgs, lib, opt-config, ... }:
{
  home.packages = with pkgs; [
    zsh
    zimfw
  ];
  # home.file.".config/zsh/.zshrc".source = ./.zshrc;
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