{ config, pkgs, lib, opt-config, ... }:
{
  home.packages = with pkgs; [
    zsh
    zimfw
  ];
  home.file.".config/zsh/.zimrc".source = ./zimrc;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    plugins = [
      {
        name = "zimfw";
        src = pkgs.zimfw;
      }
    ];
    initExtra = let
      ZIM_CONFIG_FILE = "~/.config/zsh/.zimrc";
      ZIM_HOME = "~/.config/zsh/plugins/zimfw";
    in lib.mkMerge [
      (''
        ZIM_CONFIG_FILE=~/.config/zsh/.zimrc
        ZIM_HOME=~/.config/zsh/plugins/zimfw
        # Install missing modules and update ~/.config/zsh/plugins/zimfw/init.zsh if missing or outdated.
        if [[ ! ~/.config/zsh/plugins/zimfw/init.zsh -nt ~/.config/zsh/.zimrc ]]; then
          source ~/.config/zsh/plugins/zimfw/zimfw.zsh init -q
        fi
        # Initialize modules.
        source ~/.config/zsh/plugins/zimfw/init.zsh
      '')
    ];
  };
}