{
  self,
  nixpkgs,
  nixpkgs-stable,
  nixpkgs-unstable,
  home-manager,
  nur,
  ...
} @ inputs: let
  system = "x86_64-linux";
  pkg-settings = import ./pkgs-settings.nix {
    inherit system;
    inherit nixpkgs;
    inherit nixpkgs-stable;
    inherit nixpkgs-unstable;
    inherit nur;
  };
  hosts-conf = import ./hosts-conf.nix {
    inherit pkg-settings;
  };
  system-gen = import ./hosts-conf.nix {
    inherit host-conf;
  };
in {
  nixosConfigurations = with hosts-conf;{
    "${Default-conf.name}" = system-gen { host-conf = Default; };
    "${c2h5oc2h4.name}" = system-gen { host-conf = c2h5oc2h4; };
  };
}