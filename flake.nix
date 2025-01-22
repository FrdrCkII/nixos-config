{
  description = "Frederick's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@
  {
    nixpkgs,
    home-manager,
    nixpkgs-stable,
    ...
  }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      Frbspc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          pkgs = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./nixos/hardware-configuration.nix
          ./system/system.nix
          ./system/user.nix
          ./programs/steam.nix
          ./programs/lact.nix
          ./programs/zsh.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.Frb = ./home/home.nix;
            };
          }
        ];
      };
    };
  };
}