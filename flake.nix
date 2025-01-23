{
  description = "Frederick's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@
  {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      FrdrCkII = 
      let
        inherit system;
        username = "FrdrCkII";
        specialArgs = {
          inherit username;
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
      in
      pkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./users/${username}/nixos.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs // specialArgs;
              users.${username} = import ./users/${username}/home.nix;
            };
          }
        ];
      };
    };
  };
}