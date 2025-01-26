{
  system,
  nixpkgs,
  nixpkgs-stable,
  nixpkgs-unstable,
  nur
}:
rec {
  # Superset of the default unfree packages
  allowed-unfree-packages = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
    "amdgpu-pro"
    "steam"
    "steam-original"
    "steam-unwrapped"
    "microsoft-edge"
  ];
  # Superset of the default insecure packages
  allowed-insecure-packages = [
    
  ];
  # Stable Brach Packages
  stable-pkgs = import nixpkgs-stable {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
    overlays = [ nur.overlay ];
  };
  # Unstable Brach Packages
  unstable-pkgs = import nixpkgs-unstable {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
    overlays = [ nur.overlay ];
  };
}
