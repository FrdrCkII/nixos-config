{pkg-settings}:
{
  Default = with pkg-settings; rec {
    name = "Default";
    config = (import ../hosts/${name}/options.nix { pkgs = stable-pkgs; unstable-pkgs = unstable-pkgs; }).opt-config;
  };
  c2h5oc2h4 = with pkg-settings; rec {
    name = "c2h5oc2h4";
    config = (import ../hosts/${name}/options.nix { pkgs = unstable-pkgs; stable-pkgs = stable-pkgs; }).opt-config;
  };
}
