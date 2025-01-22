{ config, pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "Frb" ];
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      builders-use-substitutes = true;
      keep-derivations = true;
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
      ];
    };
  };
}
