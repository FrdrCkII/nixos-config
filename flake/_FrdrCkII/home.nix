{ username, ... }:
{
  imports = [
    ../home/core.nix

    ../home/rofi
    ../home/shell
  ];
  programs.git = {
    enable = true;
    userName = "FrdrCkII";
    userEmail = "c2h5oc2h4@outlook.com";
  };
}