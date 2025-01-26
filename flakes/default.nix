{
  self,
  nixpkgs,
  nixpkgs-stable,
  nixpkgs-unstable,
  home-manager,
  nur,
  ...
} @inputs: let
  system = "x86_64-linux";
  # Packages Setting
  pkg-settings = import ./pkgs-settings.nix {
    inherit system;
    inherit nixpkgs;
    inherit nixpkgs-stable;
    inherit nixpkgs-unstable;
    inherit nur;
  };
  # Host Config
  hosts-conf = import ./hosts-conf.nix { inherit pkg-settings; };
  # Generate Function
  system-gen = {host-conf}: with pkg-settings; nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit allowed-unfree-packages;
      inherit allowed-insecure-packages;
      opt-config = host-conf.config;
      hostname = host-conf.name;
      inherit custom-pkgs;
    };
    modules = [
      # Add NUR
      { nixpkgs.overlays = [ nur.overlay ]; }
      # Add Unstable Nixpkg
      ({
        nixpkgs.overlays = [
          (final: prev: {
            unstable = unstable-pkgs;
          })
        ];
      })
      # System Configuration
      ../users/${host-conf.config.username}/config.nix
      # Home Manager
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${host-conf.config.username} = import ../users/${host-conf.config.username}/home.nix;
        home-manager.extraSpecialArgs = {
          inherit inputs;
          opt-config = host-conf.config;
        };
      }
    ];
  };
in {
  nixosConfigurations = with hosts-conf;{
    "${Default.name}" = system-gen { host-conf = Default; };
    "${c2h5oc2h4.name}" = system-gen { host-conf = c2h5oc2h4; };
  };
};