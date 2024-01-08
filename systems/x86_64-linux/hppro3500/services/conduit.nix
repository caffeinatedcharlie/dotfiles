# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  services.matrix-conduit = {
    enable = true;
    settings.global = {
      server_name = "downgraded.uk";
      port = 6167;
      database_backend = "rocksdb";
      allow_registration = true;
      address = "127.0.0.1";
    };
  };
  services.cloudflared = {
    enable = true;
    tunnels = {
      "07e09863-d093-4aff-8f89-94f5f712c717" = {
        credentialsFile = "/cloudflared/credentials/07e09863-d093-4aff-8f89-94f5f712c717.json";
        default = "http_status:404";
        ingress = {
          "downgraded.uk" = with config.services.matrix-conduit.settings.global; {
            service = "http://${address}:${toString port}";
          };
        };
      };
    };
  };
}
