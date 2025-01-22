{ config, lib, pkgs, ... }:
{
  imports = 
    [
      ./config/boot.nix
      ./config/hardware.nix
      ./config/i18n.nix
      ./config/nix.nix
      ./desktop/kde.nix

      ../programs/steam.nix
      ../programs/lact.nix
      ../programs/zsh.nix
    ];
  environment.systemPackages = with pkgs; [ vim wget git ];
  environment.variables.EDITOR = "vim";
  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking = {
    hostName = "Frbspc";
    networkmanager.enable = true;
    firewall.enable = true;
  };
  system = {
    stateVersion = "unstable";
    autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
  };
}
