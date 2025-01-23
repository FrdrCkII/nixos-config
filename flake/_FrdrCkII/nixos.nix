{ username, ... }:
{
  imports = [
    ../system/system.nix
    ../system/programs/lact.nix
    ../system/programs/zsh.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}