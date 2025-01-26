{ opt-config, ... }:
{
  imports = [
    ../home
  ];
  programs.git = {
    enable = true;
    userName = "${opt-config.gitname}";
    userEmail = "${opt-config.gitmail}";
  };
}