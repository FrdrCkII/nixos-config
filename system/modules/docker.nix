{ config, lib, pkgs, opt-config, ... }:
{
  # users.users.${opt-config.username}.extraGroups = [ "docker" ];
  virtualisation = {
    # docker = {
    #   enable = true;
    #   enableOnBoot = true;
    #   storageDriver = "btrfs";
    #   daemon.settings = {
    #     "registry-mirrors" = [
    #       "https://docker.m.daocloud.io"
    #     ];
    #   };
    # };
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = ["--all"];
      };
    };
    oci-containers = {
      backend = "podman";
      containers = {
        # container-name = {
        #   image = "container-image";
        #   autoStart = true;
        #   ports = [ "127.0.0.1:1234:1234" ];
        # };
      };
    };
  };
}