{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lact
  ];
  systemd.services = {
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
