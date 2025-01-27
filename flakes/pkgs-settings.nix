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
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
    "amdgpu-pro"
    "baidunetdisk"
    "dingtalk"
    "qq"
    "wechat-universal-bwrap"
    "wemeet-bin-bwrap"
    "wechat-uos"
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
    "xow_dongle-firmware"
    "microsoft-edge"
    "vscode"
  ];
  # Superset of the default insecure packages
  allowed-insecure-packages = [
    "electron-11.5.0"
    "openssl-1.1.1w"
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
