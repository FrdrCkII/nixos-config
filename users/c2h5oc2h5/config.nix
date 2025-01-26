{ opt-config, ... }:
{
  imports = [
    ../system
  ];
  users.users.${opt-config.username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}