{ config, lib, pkgs, username, ... }:
{
  environment.systemPackages = [ pkgs.distrobox ];
  users.users.${username}.extraGroups = [ "docker" ];
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