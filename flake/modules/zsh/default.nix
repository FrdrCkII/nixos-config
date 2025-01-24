{ config, pkgs, lib, username, ... }:
{
  home.packages = with pkgs; [
    zsh zimfw
    zsh-powerlevel10k
  ];
  programs.zsh = {
    enable = true;
    dotDir = "../../dotfile/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "zimfw";
        # file = "${pkgs.zimfw}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k";
        file = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ]
  }
}