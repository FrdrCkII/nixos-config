{ config, lib, pkgs, opt-config, ... }:
{
  nix.gc = lib.mkDefault {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;
    trusted-users = [ "${opt-config.username}" ];
    experimental-features = [ "nix-command" "flakes" ];
  };
}
