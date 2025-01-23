{ config, lib, pkgs, ... }:
{
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };
}