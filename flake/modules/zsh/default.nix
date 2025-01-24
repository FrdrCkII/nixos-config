{ config, pkgs, lib, username, ... }:
{
  nix.packages = [ pkgs.zsh-powerlevel10k ];
  programs.zsh = {
    enable = true;
    dotDir = "../../dotfile/zsh";
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}