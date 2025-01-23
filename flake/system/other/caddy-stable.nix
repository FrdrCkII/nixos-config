{ config, lib, pkgs, username, ... }:
{
  environment.systemPackages = [
    pkgs.caddy
  ];
  systemd.services = {
    caddy-stable = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "Steam & Github Reverse Proxy (Old)";
      serviceConfig = {
        WorkingDirectory = "/data/.tools/steamcommunity_302_12.1.30/SteamDeck_302/";
        ExecStart = ''${pkgs.caddy}/bin/caddy run --config /data/.tools/steamcommunity_302_12.1.30/SteamDeck_302/steamcommunity_302.caddy.json --adapter caddyfile'';
        Restart = ''on-failure'';
      };
    };
  };
  security.pki.certificateFiles = [
    /data/.tools/steamcommunity_302_12.1.30/SteamDeck_302/steamcommunity.crt
    /data/.tools/steamcommunity_302_12.1.30/SteamDeck_302/steamcommunity.key
    /data/.tools/steamcommunity_302_12.1.30/SteamDeck_302/steamcommunityCA.pem
  ];
  networking.extraHosts = ''
    127.0.0.1 pixiv.net
    127.0.0.1 www.pixiv.net
    127.0.0.1 fanbox.cc
    127.0.0.1 www.fanbox.cc
    127.0.0.1 api.fanbox.cc
  '';
}