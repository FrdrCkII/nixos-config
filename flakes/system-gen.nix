{host-conf}:
with pkg-settings; nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit allowed-unfree-packages;
    inherit allowed-insecure-packages;
    opt-config = host-conf.config;
    hostname = host-conf.name;
    inherit custom-pkgs;
  };
  modules = [
    { nixpkgs.overlays = [ nur.overlay ]; }
    ({
      nixpkgs.overlays = [
        (final: prev: {
          stable = stable-pkgs;
        })
      ];
    })
    # System Configuration
    ../user/${host-conf.config.username}/config.nix
    # Home Manager
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${host-conf.config.username} = import ../user/${host-conf.config.username}/home.nix;
      home-manager.extraSpecialArgs = {
        inherit inputs;
        opt-config = host-conf.config;
      };
    }
  ];
}