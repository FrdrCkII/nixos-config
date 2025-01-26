{ config, pkgs, lib, opt-config, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh
    thefuck
    zsh-powerlevel10k
  ];
  users.users.${opt-config.username}.shell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
    };
  };
}