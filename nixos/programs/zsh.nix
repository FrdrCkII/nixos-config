{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
  ];
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  # users.users.Frb.shell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    shellAliases = {
      nixos-test = "sudo nixos-rebuild test --flake '/data/nixos-config#Frbspc' --impure";
      nixos-switch = "sudo nixos-rebuild switch --flake '/data/nixos-config#Frbspc' --impure";
      nixos-update = "sudo nixos-rebuild switch --flake '/data/nixos-config#Frbspc' --impure --upgrade";
    };
    
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}