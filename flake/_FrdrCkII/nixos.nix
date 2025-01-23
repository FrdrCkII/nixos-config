{ username, ... }:
{
  imports = [
    ../system/system.nix
    ../programs/lact.nix
    ../programs/zsh.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}