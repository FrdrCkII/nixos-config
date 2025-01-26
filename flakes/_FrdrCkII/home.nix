{ username, ... }:
{
  imports = [
    ../../modules/home/core.nix
  ];
  programs.git = {
    enable = true;
    userName = "FrdrCkII";
    userEmail = "c2h5oc2h4@outlook.com";
  };
}