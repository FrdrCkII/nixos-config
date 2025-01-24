{
  description = "Frederick's NixOS Flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@
  {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nur,
    ...
  }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      FrdrCkII = 
      let
        username = "FrdrCkII";
        specialArgs = { inherit username; };
      in
      nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;
        modules = [
          ./flake/_${username}/nixos.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs // specialArgs;
              users.${username} = import ./flake/_${username}/home.nix;
            };
          }
          nur.modules.nixos.default
          nur.legacyPackages."${system}".repos.iopq.modules.xraya
        ];
      };
    };
  };
}