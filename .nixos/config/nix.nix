{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = lib.mkForce true;
  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;
    trusted-users = [ "root" "FrdrCkII" ];
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
}
