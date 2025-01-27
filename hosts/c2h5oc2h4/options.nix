{pkgs, stable-pkgs, ...}:
{
  opt-config = rec {
    username = "FrdrCkII";
    gitname = "FrdrCkII";
    gitmail = "c2h5oc2h4@outlook.com";
    gitbranch = "main";
    gpu-type = [ "amd" ];
    desktop = [ "kde" ];

    SystemPackages = with pkgs; [
      activate-linux
      zip unzip
      p7zip
      yazi
    ];
    HomePackages = with pkgs; [
      fastfetch
      btrfs-assistant
      libreoffice
      vscode
      microsoft-edge
      thunderbird
      motrix
      wine
      distrobox
      prismlauncher
    ];
  };
}
