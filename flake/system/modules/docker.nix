{ config, lib, pkgs, username, ... }:
{
  environment.systemPackages = [ pkgs.distrobox ];
  users.users.${username}.extraGroups = [ "docker" ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    daemon.settings = {
      "registry-mirrors" = [
        "https://docker.nastool.de"
        "https://docker.1ms.run"
        "https://docker.1panel.live"
        "https://hub1.nat.tf"
        "https://docker.1panel.top"
        "https://dockerpull.org"
        "https://docker.13140521.xyz"
        "https://registry.docker-cn.com"
      ];
    };
  };
}