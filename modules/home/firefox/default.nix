{ inputs, config, osConfig, lib, pkgs, ... }:

{
  config = lib.mkIf config.programs.firefox.enable {
    programs.firefox = {
      arkenfox = {
        enable = true;
        version = "122.0";
      };
      profiles.default = {
        isDefault = true;
        name = "default";
        id = 0;
        arkenfox = {
          enable = true;
          "0000".enable = true; # about:config warning disabled
          "0100" = {
            # Clear default topsites and disable sponsored content but keep new tab page
            enable = true;
            "0102"."browser.startup.page".value = 1;
            "0103"."browser.startup.homepage".value = "about:home";
            "0104"."browser.newtabpage.enabled".value = true;
          };
          "0200" = {
            # Switch to Mozilla geolocation service and disable OS's built in geolocation service.
            enable = true;
            "0202"."geo.provider.use_gpsd".value = true;
          };
          "0300".enable = true; # Disable telemetry and all recommendation
          "0400".enable = true; # Disable safe browsing remotely checking downloads
          "0700" = {
            # DNS / DoH / PROXY / SOCKS
            enable = true;
            "0710"."network.trr.mode".enable = true;
            "0712"."network.trr.uri" = {
              enable = true;
              value = "https://mozilla.cloudflare-dns.com/dns-query";
            };
          };
          "0800".enable = true; # Disable search history
          "0900".enable = true; # Disable Firefox password management
          "1200".enable = true; # HTTPS only
          "1600".enable = true; # Less cross-origin information sent
          "1700".enable = true; # Enable Container Tabs
          "2800" = {
            # Clear cache, download history, formdata and history on closing Firefox
            enable = true;
            "2811" = {
              enable = true;
              "privacy.clearOnShutdown.sessions".value = false; # Disable clearing session data
            };
            "2815".enable = false; # Disable cookie and site data clearing on close
          };
        };
        settings = {
          "browser.tabs.firefox-view" = false; # Disable Firefox View
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customisation
        };
        userChrome = ''
          .titlebar-buttonbox {
              display: none !important;
          }
          .titlebar-spacer {
              display: none !important;
          }
          :root {
              --tab-border-radius: 50px !important;
              --tabs-border-color: transparent !important;
          }
          #navigator-toolbox {
              border: 0px !important;
          }
          #TabsToolbar {
              margin-left: 35vw !important;
          }
          #nav-bar {
              background: transparent !important;
              margin-top: -38px !important;
              margin-bottom: 3px !important;
              margin-right: 65vw !important;
          }
          #urlbar-container {
              width: unset !important;
              min-width: 0px !important;
              transition: min-width 0.6s cubic-bezier(0.16, 1, 0.3, 1), transform 0.6s cubic-bezier(0.16, 1, 0.3, 1) !important;
              transition-property: min-width transform;
          }
          #nav-bar[urlbar-exceeds-toolbar-bounds="true"] #urlbar-container {
              min-width: 100vw !important;
              border: 0px none !important;
              transform: translateX(-112px);
              z-index: 999999 !important;
          }
          #urlbar-background, #searchbar {
              border: 0px none !important;
          }
          #urlbar {
              background: transparent !important;
              border: none !important;
              box-shadow: none !important;
          }
          #page-action-buttons {
              display: none !important;
          }
          #PanelUI-button {
              display: none !important;
          }
          #nav-bar:not([tabs-hidden="true"]) {
              box-shadow: none !important;
          }
        '';
      };
    };
  };
}
