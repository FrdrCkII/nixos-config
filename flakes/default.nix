{
  self,
  nixpkgs,
  nixpkgs-stable,
  nixpkgs-unstable,
  home-manager,
  nur,
  ...
} @ inputs: {
  nixosConfigurations = {
    FrdrCkII = 
    let
      system = "x86_64-linux";
      username = "FrdrCkII";
      specialArgs = {
        inherit system;
        inherit username;
      };
    in
    nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = [
        ./_${username}/nixos.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = inputs // specialArgs;
            users.${username} = import ./_${username}/home.nix;
          };
        }
        nur.modules.nixos.default
        nur.legacyPackages."${system}".repos.iopq.modules.xraya
      ];
    };
  };
}