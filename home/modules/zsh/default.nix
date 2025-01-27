{ config, pkgs, lib, opt-config, ... }:
{
  home.packages = with pkgs; [
    zsh
    zimfw
  ];
  home.file.".config/zsh/.zimrc".source = ./zimrc;
  home.file.".config/zsh/zimfw/zimfw.zsh".source = /home/${opt-config.username}/.config/zsh/plugins/zimfw/zimfw.zsh;
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
      ZIM_HOME = "~/.config/zsh/zimfw";
    in lib.mkMerge [
      (''
        ZIM_CONFIG_FILE=${ZIM_CONFIG_FILE}
        ZIM_HOME=${ZIM_HOME}
        # Download zimfw plugin manager if missing.
        if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
          mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
              https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
        fi
        # Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
        if [[ ! ${ZIM_HOME}init.zsh -nt ${ZIM_CONFIG_FILE} ]]; then
          source ${ZIM_HOME}/zimfw.zsh init -q
        fi
        # Initialize modules.
        source ${ZIM_HOME}/init.zsh
      '')
    ];
  };
}