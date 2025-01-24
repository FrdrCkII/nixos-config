{
  description = "Frederick's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Stable
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    # HomeManager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # NUR
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nur,
    ...
  }@inputs:
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