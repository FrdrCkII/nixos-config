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
      yazi
      zip unzip
      p7zip
    ];
    HomePackages = with pkgs; [
      fastfetch
      vscode
      # microsoft-edge
      motrix
      wine
    ];
  };
}
