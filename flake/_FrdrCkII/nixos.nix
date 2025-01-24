{ pkgs, username, ... }:
{
  imports = [
    ../system/system.nix
    ../modules/zsh/user.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}