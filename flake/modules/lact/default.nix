{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [ lact ];
  systemd.user.services = {
    lactd = {
      Unit = {
        Description = "AMDGPU Control Daemon";
        After = "multi-user.target";
      };
      Service = {
        ExecStart = "lact daemon";
        Restart = "on-failure";
        Nice = "-10";
      };
      Install = {
        WantedBy = "multi-user.target";
      };
    };
  };
}
