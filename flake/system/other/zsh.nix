{ config, pkgs, lib, username, ... }:
{
  environment.systemPackages = with pkgs; [ zsh-powerlevel10k ];
  environment.pathsToLink = [ "/share/zsh" ];
  users.users.${username}.shell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}