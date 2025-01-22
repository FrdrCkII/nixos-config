{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ vscode ];
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];
  };
}