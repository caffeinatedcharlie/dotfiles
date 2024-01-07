{ config, lib, pkgs, inputs, ... }:

{
  services.gotosocial = {
    enable = true;
    setupPostgresqlDB = true;
    settings = {
      application-name = "My GoToSocial";
      host = "busygam.ing";
      protocol = "https";
      bind-address = "127.0.0.1";
      storage-local-base-path = "/var/lib/gotosocial/storage";
      accounts-registration-open = false;
      accounts-reason-required = false;
      port = 8080;
    };
  };
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    clientMaxBodySize = "40M";
    virtualHosts = with config.services.gotosocial.settings; {
      "${host}" = {
        enableACME = true;
        forceSSL = true;
        locations = {
          "/" = {
            recommendedProxySettings = true;
            proxyWebsockets = true;
            proxyPass = "http://${bind-address}:${toString port}";
          };
        };
      };
    };
  };
}
