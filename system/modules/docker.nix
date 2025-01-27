{ config, lib, pkgs, opt-config, ... }:
{
  users.users.${opt-config.username}.extraGroups = [ "docker" ];
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = false;
        setSocketVariable = true;
      };
      storageDriver = "btrfs";
      daemon.settings = {
        "registry-mirrors" = [
          "https://docker.m.daocloud.io"
        ];
      };
    };
  };
}