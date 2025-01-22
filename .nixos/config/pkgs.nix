{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    microsoft-edge
    vscode
  ];
}
