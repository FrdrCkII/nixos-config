{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    microsoft-edge
    vscode
  ];
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];
  };
}