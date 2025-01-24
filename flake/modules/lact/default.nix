{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [ lact ];
  systemd.user.services = {
    lactd = {
      wantedBy = [ "multi-user.target" ];
      after = [ "multi-user.target" ];
      description = "AMDGPU Control Daemon";
      serviceConfig = {
        ExecStart = ''${pkgs.lact}/bin/lact daemon'';
        Restart = ''on-failure'';
        Nice = ''-10'';
      };
    };
  };
}
