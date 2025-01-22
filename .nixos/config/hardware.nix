{ config, lib, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ mesa ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ mesa ];
  };
}
