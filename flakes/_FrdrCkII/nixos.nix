{ username, ... }:
{
  imports = [
    ../../modules/system/system.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}