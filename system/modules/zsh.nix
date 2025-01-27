{ config, pkgs, lib, opt-config, ... }:
{
  programs.zsh.enable = true;
  users.users.${opt-config.username}.shell = pkgs.zsh;
}