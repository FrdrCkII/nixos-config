{
  description = "Frederick's NixOS Flake";

  inputs = {
    pkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "pkgs";
  };

  outputs = inputs@
  {
    self,
    pkgs,
    pkgs-stable,
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
        username = "FrdrCkII";
        specialArgs = {inherit username;};
      in
        nixpkgs.lib.nixosSystem {
          inherit system;
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