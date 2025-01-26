{ config, lib, pkgs, opt-config, ... }:
{
  environment.systemPackages = [ pkgs.distrobox ];
  users.users.${opt-config.username}.extraGroups = [ "docker" ];
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
    daemon.settings = {
      "registry-mirrors" = [
        "https://docker.m.daocloud.io"
      ];
    };
  };
}