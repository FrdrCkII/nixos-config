{ config, lib, pkgs, ... }:
{
  services.nginx = {
    enable = true;
    package = [ pkgs.nginx ];
    config = ''
      server {
        listen localhost:443 ssl;# 监听localhost的443端口
        # 添加要监听的域名,与Hosts文件里的域名一致
        server_name steamcommunity.com;
        server_name www.steamcommunity.com;
        server_name store.steampowered.com;
        server_name checkout.steampowered.com;
        server_name api.steampowered.com;
        server_name help.steampowered.com;
        server_name login.steampowered.com;
        server_name store.akamai.steamstatic.com;
        server_name steambroadcast.akamaized.net;
        server_name steamvideo-a.akamaihd.net;
        server_name steamusercontent-a.akamaihd.net;
        server_name steamstore-a.akamaihd.net;
        server_name steamcommunity-a.akamaihd.net;
        server_name steamcdn-a.akamaihd.net;
        server_name steamuserimages-a.akamaihd.net;
        server_name community.akamai.steamstatic.com;
        server_name avatars.akamai.steamstatic.com;
        server_name community.steamstatic.com;
        server_name cdn.akamai.steamstatic.com;
        server_name avatars.steamstatic.com;
        server_name shared.akamai.steamstatic.com;
        server_name clan.akamai.steamstatic.com;
        server_name cdn.cloudflare.steamstatic.com;
        server_name community.cloudflare.steamstatic.com;
        server_name store.cloudflare.steamstatic.com;
        server_name avatars.cloudflare.steamstatic.com;
        server_name clan.cloudflare.steamstatic.com;
        server_name shared.cloudflare.steamstatic.com;
        server_name www.google.com;
        server_name steam-chat.com;
        server_name github.com;
        server_name www.github.com;
        server_name gist.github.com;
        server_name api.github.com;
        server_name raw.github.com;
        server_name raw.githubusercontent.com;
        server_name camo.githubusercontent.com;
        server_name cloud.githubusercontent.com;
        server_name avatars.githubusercontent.com;
        server_name avatars0.githubusercontent.com;
        server_name avatars1.githubusercontent.com;
        server_name avatars2.githubusercontent.com;
        server_name avatars3.githubusercontent.com;
        server_name private-user-images.githubusercontent.com;
        server_name user-images.githubusercontent.com;
        server_name github-releases.githubusercontent.com;
        server_name objects.githubusercontent.com;
        server_name analytics.githubassets.com;
        server_name assets-cdn.github.com;
        server_name github.githubassets.com;
        server_name support-assets.githubassets.com;
        server_name codeload.github.com;
        server_name pages.github.com;
        server_name docs.github.com;
        server_name services.github.com;
        server_name resources.github.com;
        server_name developer.github.com;
        server_name partner.github.com;
        server_name desktop.github.com;
        server_name support.github.com;
        server_name education.github.com;
        server_name enterprise.github.com;
        server_name lab.github.com;
        server_name classroom.github.com;
        server_name central.github.com;
        server_name desktop.githubusercontent.com;
        server_name guides.github.com;
        server_name copilot.github.com;
        server_name github.io;
        server_name www.github.io;
        server_name *.github.io; #[Please change the prefix to support github.io]
        server_name steamcloud-ugc.storage.googleapis.com;
        server_name www.youtube.com;
        server_name steamcloud-eu-ams.storage.googleapis.com;
        server_name steamcloud-eu-fra.storage.googleapis.com;
        server_name steamcloud-finland.storage.googleapis.com;
        server_name steamcloud-saopaulo.storage.googleapis.com;
        server_name steamcloud-singapore.storage.googleapis.com;
        server_name steamcloud-sydney.storage.googleapis.com;
        server_name steamcloud-taiwan.storage.googleapis.com;
        server_name steamcloud-eu.storage.googleapis.com;

        ssl_certificate /data/.tools/steamcommunity_302/steamcommunity.crt;
        ssl_certificate_key /data/.tools/steamcommunity_302/steamcommunity.key;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;
        ssl_prefer_server_ciphers on;

        location / {
          proxy_pass https://23.2.12.202/;
          proxy_set_header Host $http_host;
        }
      }
    '';
  };
  security.pki.certificateFiles = [
    /data/.tools/steamcommunity_302/steamcommunity.crt
    /data/.tools/steamcommunity_302/steamcommunity.key
    /data/.tools/steamcommunity_302/steamcommunityCA.key
    /data/.tools/steamcommunity_302/steamcommunityCA.pem
  ];
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