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
    configFile = ''
      {
      #Export From SteamCommunity302
      admin off
      auto_https off
      }
      (PNA_CORS) {
          @options {
          method OPTIONS
          }
          respond @options 204
          header {
          Access-Control-Allow-Origin {http.request.header.Origin}
          ###Access-Control-Allow-Credentials false
          Access-Control-Allow-Methods *
          Access-Control-Allow-Headers *
          Access-Control-Allow-Private-Network true
          Access-Control-Request-Private-Network true
          defer
          }
      }

      https://steamcommunity.com:443 https://www.steamcommunity.com:443 {
          tls steamcommunity.crt steamcommunity.key
          @steamcommunityrp {
          path /comment/*
          path /forum/*
          path *discussions*
          path *tradingforum*
          path *eventcomments*
          path /chat/beginfileupload/*
          }
          @steamcommunitybypass {
          path /id/*
          path /profiles/*
          }
          reverse_proxy @steamcommunityrp https://str001.steam302.xyz https://str002.steam302.xyz https://str003.steam302.xyz https://str004.steam302.xyz {
          header_up Host steamcommunity.com
          header_up User-Agent ".*" "$0 Googlebot/2.1 (+http://www.google.com/bot.html)"
          lb_policy random_choose 3
          fail_duration 3s
          max_fails 3
          unhealthy_latency 1000ms
          unhealthy_status 5xx
          transport http {
          tls
          tls_server_name statuspage.akamaized.net
          #tls_insecure_skip_verify
          }
      }

          reverse_proxy @steamcommunitybypass https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host steamcommunity.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
            tls
            tls_server_name img-s-msn-com.akamaized.net
            #tls_insecure_skip_verify
          }
          }
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host steamcommunity.com
          header_up User-Agent ".*" "$0 Googlebot/2.1 (+http://www.google.com/bot.html)"
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
            tls
            tls_server_name img-s-msn-com.akamaized.net
            #tls_insecure_skip_verify
          }
          }
      }

      https://store.steampowered.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          # default/catchall
          @steamstreoapp {
          path /app/*
          path /agecheck/*
          }
          @steamstreofriends {
        path /friends/*
        path /api/addtowishlist
        path /explore/followgame/*
          }

          reverse_proxy @steamstreoapp https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host store.steampowered.com
          header_up User-Agent ".*" "$0 Googlebot/2.1 (+http://www.google.com/bot.html)"
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }

          reverse_proxy @steamstreofriends https://str001.steam302.xyz https://str002.steam302.xyz https://str003.steam302.xyz {
          header_up Host store.steampowered.com
            transport http {
            tls
            tls_server_name statuspage.akamaized.net
            #tls_insecure_skip_verify
          }
          }

          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host store.steampowered.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }
      }

      https://api.steampowered.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          # default/catchall
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host api.steampowered.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }
      }

      https://help.steampowered.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          # default/catchall
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host help.steampowered.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }
      }

      https://login.steampowered.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          # default/catchall
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host login.steampowered.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }
      }


      https://store.akamai.steamstatic.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          # default/catchall
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host store.akamai.steamstatic.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }
      }

      https://checkout.steampowered.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          # default/catchall
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          header_up Host checkout.steampowered.com
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          }
      }
      https://steambroadcast.akamaized.net:443 https://steamvideo-a.akamaihd.net:443 https://steamstore-a.akamaihd.net:443 https://steamusercontent-a.akamaihd.net:443 https://steamcommunity-a.akamaihd.net:443 https://steamcdn-a.akamaihd.net:443 https://steamuserimages-a.akamaihd.net:443 https://community.akamai.steamstatic.com:443 https://avatars.akamai.steamstatic.com:443 https://community.steamstatic.com:443 https://cdn.akamai.steamstatic.com:443 https://avatars.steamstatic.com:443 https://shared.akamai.steamstatic.com:443 https://clan.akamai.steamstatic.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          header_up Host {host}
          }
      }

      https://cdn.cloudflare.steamstatic.com:443 https://community.cloudflare.steamstatic.com:443 https://store.cloudflare.steamstatic.com:443 https://avatars.cloudflare.steamstatic.com:443 https://shared.cloudflare.steamstatic.com:443 https://clan.cloudflare.steamstatic.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls
          tls_server_name img-s-msn-com.akamaized.net
          #tls_insecure_skip_verify
          }
          header_up Host cloudflare akamai
          }
      }

      https://www.google.com:443 {
      #tls self_signed
      tls steamcommunity.crt steamcommunity.key
          @recaptcha {
          path /recaptcha/*
          }
          reverse_proxy @recaptcha https://www.recaptcha.net {
          transport http {
        tls
        tls_server_name www.recaptcha.net
          }
          header_up Host www.recaptcha.net
      }
          reverse_proxy https://google.com {
          transport http {
        tls
        tls_server_name www.google.com
          }
          header_up Host www.google.com
          }
      }


      https://steam-chat.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          header Access-Control-Allow-Origin https://steamloopback.host
          @steamchatimg {
          method POST
          path /chat/beginfileupload/*
          }

          reverse_proxy @steamchatimg https://str001.steam302.xyz https://str002.steam302.xyz https://str003.steam302.xyz {
          header_up Host {host}
          lb_policy random_choose 2
          fail_duration 3s
          max_fails 3
          unhealthy_latency 1000ms
          unhealthy_status 5xx
          transport http {
          tls
          tls_server_name statuspage.akamaized.net
          #tls_insecure_skip_verify
          }
      }

          reverse_proxy https://steamuserimages-a.akamaihd.net.edgesuite.net https://steamstore-a.akamaihd.net.edgesuite.net https://eaassets-a.akamaihd.net.edgesuite.net https://steamcommunity-a.akamaihd.net.edgesuite.net {
          dynamic a steamuserimages-a.akamaihd.net.edgesuite.net 443
          dynamic a steamstore-a.akamaihd.net.edgesuite.net 443
          dynamic a eaassets-a.akamaihd.net.edgesuite.net 443
          dynamic a steamcommunity-a.akamaihd.net.edgesuite.net 443
          lb_try_duration 5s
          lb_policy random_choose 4
          transport http {
          tls_server_name img-s-msn-com.akamaized.net
          tls
          }
          header_up Host {host}
          }
      }

      https://steamcloud-ugc.storage.googleapis.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://storage.googleapis.com https://chromedriver.storage.googleapis.com https://216.58.200.240 https://172.217.160.80 https://172.217.160.112 https://172.217.25.208 https://34.64.4.16 {
          lb_policy random_choose 3
          fail_duration 3s
          max_fails 3
          unhealthy_latency 1000ms
          unhealthy_status 5xx
          header_up Host {host}
          transport http {
          tls
          tls_server_name "uploads"
          tls_insecure_skip_verify
          }
          }
      }

      https://github.com:443 https://www.github.com:443 https://gist.github.com:443 {
      tls steamcommunity.crt steamcommunity.key

          reverse_proxy https://1.ghmain.steam302.xyz https://2.ghmain.steam302.xyz https://3.ghmain.steam302.xyz https://1.ghmain.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }

      https://api.github.com:443 {
      tls steamcommunity.crt steamcommunity.key

          reverse_proxy https://1.ghapi.steam302.xyz https://2.ghapi.steam302.xyz https://3.ghapi.steam302.xyz https://4.ghapi.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }

      https://codeload.github.com:443 {
      tls steamcommunity.crt steamcommunity.key

          reverse_proxy https://1.ghcodel.steam302.xyz https://2.ghcodel.steam302.xyz https://3.ghcodel.steam302.xyz https://4.ghcodel.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }

      https://support.github.com:443 {
      tls steamcommunity.crt steamcommunity.key

          reverse_proxy https://1.ghsp.steam302.xyz https://2.ghsp.steam302.xyz https://3.ghsp.steam302.xyz https://4.ghsp.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 1000ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }


      https://raw.githubusercontent.com:443 https://raw.github.com:443 https://camo.githubusercontent.com:443 https://cloud.githubusercontent.com:443 https://avatars.githubusercontent.com:443 https://avatars0.githubusercontent.com:443 https://avatars1.githubusercontent.com:443 https://avatars2.githubusercontent.com:443 https://avatars3.githubusercontent.com:443 https://user-images.githubusercontent.com:443 https://private-user-images.githubusercontent.com:443 https://github-releases.githubusercontent.com:443 https://analytics.githubassets.com:443 https://desktop.githubusercontent.com:443 https://lab.github.com:443 https://assets-cdn.github.com:443 https://www.github.io:443 https://*.github.io:443 https://pages.github.com:443 https://resources.github.com:443 https://developer.github.com:443 https://partner.github.com:443 https://desktop.github.com:443 https://guides.github.com:443 https://github-releases.githubusercontent.com:443 https://objects.githubusercontent.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://1.ghcontent.steam302.xyz https://2.ghcontent.steam302.xyz https://3.ghcontent.steam302.xyz https://4.ghcontent.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }



      https://github.githubassets.com:443 https://docs.github.com:443 https://support-assets.githubassets.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://1.ghassets.steam302.xyz https://2.ghassets.steam302.xyz https://3.ghassets.steam302.xyz https://4.ghassets.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }

      https://copilot.github.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://1.ghcl.steam302.xyz https://2.ghcl.steam302.xyz https://3.ghcl.steam302.xyz https://4.ghcl.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }

      https://services.github.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://1.ghsvc.steam302.xyz https://2.ghsvc.steam302.xyz https://3.ghsvc.steam302.xyz https://4.ghsvc.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }

      https://education.github.com:443 https://enterprise.github.com:443 https://classroom.github.com:443 https://central.github.com:443 {
      tls steamcommunity.crt steamcommunity.key

          reverse_proxy https://1.ghedu.steam302.xyz https://2.ghedu.steam302.xyz https://3.ghedu.steam302.xyz https://4.ghedu.steam302.xyz {
        lb_policy random_choose 3
        fail_duration 3s
        max_fails 3
        unhealthy_latency 500ms
        unhealthy_status 5xx
          transport http {
          tls
          tls_insecure_skip_verify
        tls_server_name "Github"
          }
          header_up Host {host}
          }
      }
      https://www.youtube.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          @notiframeapi {
              not path /iframe_api
              not path /iframe_api.js
          }
          #@bypasssteamdeck {
          #    header_regexp Referer .*steamloopback.host
          #}
          #respond @bypasssteamdeck 200 {
          #    close
          #}
          reverse_proxy @notiframeapi https://youtube.com {
          transport http {
        tls
        tls_server_name www.youtube.com
          }
          header_up Host www.youtube.com
          }
        file_server  /iframe_api*
      }

      https://steamcloud-eu-ams.storage.googleapis.com:443 https://steamcloud-eu-fra.storage.googleapis.com:443 https://steamcloud-finland.storage.googleapis.com:443 https://steamcloud-saopaulo.storage.googleapis.com:443 https://steamcloud-singapore.storage.googleapis.com:443 https://steamcloud-sydney.storage.googleapis.com:443 https://steamcloud-taiwan.storage.googleapis.com:443 https://steamcloud-eu.storage.googleapis.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://storage.googleapis.com https://chromedriver.storage.googleapis.com {
        lb_policy random
        lb_try_duration 5s
          header_up Host {host}
          transport http {
          tls
          tls_server_name "uploads"
          tls_insecure_skip_verify
          }
          }
      }

      https://store.st.dl.eccdnx.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://store.cdn.queniuqe.com {
          header_up Host store.cdn.queniuqe.com
          transport http {
          tls
          tls_insecure_skip_verify
          tls_server_name store.cdn.queniuqe.com
          }
          }
      }

      https://media.st.dl.eccdnx.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://media.cdn.queniuqe.com {
          header_up Host media.cdn.queniuqe.com
          transport http {
          tls
          tls_insecure_skip_verify
          tls_server_name media.cdn.queniuqe.com
          }
          }
      }

      https://avatars.st.dl.eccdnx.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://avatars.cdn.queniuqe.com {
          header_up Host avatars.cdn.queniuqe.com
          transport http {
          tls
          tls_insecure_skip_verify
          tls_server_name avatars.cdn.queniuqe.com
          }
          }
      }

      https://clan.st.dl.eccdnx.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://clan.cdn.queniuqe.com {
          header_up Host clan.cdn.queniuqe.com
          transport http {
          tls
          tls_insecure_skip_verify
          tls_server_name clan.cdn.queniuqe.com
          }
          }
      }

      https://video.st.dl.eccdnx.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://video.cdn.queniuqe.com {
          header_up Host video.cdn.queniuqe.com
          transport http {
          tls
          tls_insecure_skip_verify
          tls_server_name video.cdn.queniuqe.com
          }
          }
      }

      https://shared.st.dl.eccdnx.com:443 {
      tls steamcommunity.crt steamcommunity.key
          import PNA_CORS
          reverse_proxy https://shared.cdn.queniuqe.com {
          header_up Host shared.cdn.queniuqe.com
          transport http {
          tls
          tls_insecure_skip_verify
          tls_server_name shared.cdn.queniuqe.com
          }
          }
      }
    '';
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