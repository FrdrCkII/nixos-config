{ config, lib, pkgs, username, ... }:
{
  environment.systemPackages = [
    pkgs.caddy
  ];
  security.pki.certificateFiles = [
    /data/.tools/steamcommunity_302/steamcommunity.crt
    /data/.tools/steamcommunity_302/steamcommunity.key
    /data/.tools/steamcommunity_302/steamcommunityCA.key
    /data/.tools/steamcommunity_302/steamcommunityCA.pem
  ];
  services.caddy = {
    enable = true;
    user = "${username}";
    configFile = "/data/.tools/steamcommunity_302/SteamDeck_302/steamcommunity_302.caddy.json";
  };
  networking.extraHosts = ''
    127.0.0.1 steamcommunity.com
    127.0.0.1 www.steamcommunity.com
    127.0.0.1 store.steampowered.com
    127.0.0.1 checkout.steampowered.com
    127.0.0.1 api.steampowered.com
    127.0.0.1 help.steampowered.com
    127.0.0.1 login.steampowered.com
    127.0.0.1 store.akamai.steamstatic.com
    127.0.0.1 steambroadcast.akamaized.net
    127.0.0.1 steamvideo-a.akamaihd.net
    127.0.0.1 steamusercontent-a.akamaihd.net
    127.0.0.1 steamstore-a.akamaihd.net
    127.0.0.1 steamcommunity-a.akamaihd.net
    127.0.0.1 steamcdn-a.akamaihd.net
    127.0.0.1 steamuserimages-a.akamaihd.net
    127.0.0.1 community.akamai.steamstatic.com
    127.0.0.1 avatars.akamai.steamstatic.com
    127.0.0.1 community.steamstatic.com
    127.0.0.1 cdn.akamai.steamstatic.com
    127.0.0.1 avatars.steamstatic.com
    127.0.0.1 shared.akamai.steamstatic.com
    127.0.0.1 clan.akamai.steamstatic.com
    127.0.0.1 cdn.cloudflare.steamstatic.com
    127.0.0.1 community.cloudflare.steamstatic.com
    127.0.0.1 store.cloudflare.steamstatic.com
    127.0.0.1 avatars.cloudflare.steamstatic.com
    127.0.0.1 clan.cloudflare.steamstatic.com
    127.0.0.1 shared.cloudflare.steamstatic.com
    127.0.0.1 www.google.com
    127.0.0.1 steam-chat.com
    127.0.0.1 github.com
    127.0.0.1 www.github.com
    127.0.0.1 gist.github.com
    127.0.0.1 api.github.com
    127.0.0.1 raw.github.com
    127.0.0.1 raw.githubusercontent.com
    127.0.0.1 camo.githubusercontent.com
    127.0.0.1 cloud.githubusercontent.com
    127.0.0.1 avatars.githubusercontent.com
    127.0.0.1 avatars0.githubusercontent.com
    127.0.0.1 avatars1.githubusercontent.com
    127.0.0.1 avatars2.githubusercontent.com
    127.0.0.1 avatars3.githubusercontent.com
    127.0.0.1 private-user-images.githubusercontent.com
    127.0.0.1 user-images.githubusercontent.com
    127.0.0.1 github-releases.githubusercontent.com
    127.0.0.1 objects.githubusercontent.com
    127.0.0.1 analytics.githubassets.com
    127.0.0.1 assets-cdn.github.com
    127.0.0.1 github.githubassets.com
    127.0.0.1 support-assets.githubassets.com
    127.0.0.1 codeload.github.com
    127.0.0.1 pages.github.com
    127.0.0.1 docs.github.com
    127.0.0.1 services.github.com
    127.0.0.1 resources.github.com
    127.0.0.1 developer.github.com
    127.0.0.1 partner.github.com
    127.0.0.1 desktop.github.com
    127.0.0.1 support.github.com
    127.0.0.1 education.github.com
    127.0.0.1 enterprise.github.com
    127.0.0.1 lab.github.com
    127.0.0.1 classroom.github.com
    127.0.0.1 central.github.com
    127.0.0.1 desktop.githubusercontent.com
    127.0.0.1 guides.github.com
    127.0.0.1 copilot.github.com
    127.0.0.1 github.io
    127.0.0.1 www.github.io
    127.0.0.1 *.github.io #[Please change the prefix to support github.io]
    127.0.0.1 steamcloud-ugc.storage.googleapis.com
    127.0.0.1 www.youtube.com
    127.0.0.1 steamcloud-eu-ams.storage.googleapis.com
    127.0.0.1 steamcloud-eu-fra.storage.googleapis.com
    127.0.0.1 steamcloud-finland.storage.googleapis.com
    127.0.0.1 steamcloud-saopaulo.storage.googleapis.com
    127.0.0.1 steamcloud-singapore.storage.googleapis.com
    127.0.0.1 steamcloud-sydney.storage.googleapis.com
    127.0.0.1 steamcloud-taiwan.storage.googleapis.com
    127.0.0.1 steamcloud-eu.storage.googleapis.com
  '';
}