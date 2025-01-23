{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    plugins = [
      {
        name = "zimfw";
        # src = pkgs.fetchFromGitHub {
        #   owner = "marlonrichert";
        #   repo = "zsh-autocomplete";
        #   rev = "23.07.13";
        #   sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
        # };
      }
    ];
  };
}