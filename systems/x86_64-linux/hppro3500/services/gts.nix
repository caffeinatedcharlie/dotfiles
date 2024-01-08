# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  services.gotosocial = {
    enable = true;
    setupPostgresqlDB = true;
    settings = {
      host = "gts.busygam.ing";
      protocol = "https";
      bind-address = "127.0.0.1";
      storage-local-base-path = "/var/lib/gotosocial/storage";
      accounts-registration-open = false;
      accounts-reason-required = false;
      port = 65535;
    };
  };
  services.cloudflared = {
    enable = true;
    tunnels = {
      "0e783743-e754-4ae2-a095-2346280a6b94" = {
        credentialsFile = "/home/user/.cloudflared/0e783743-e754-4ae2-a095-2346280a6b94.json";
        ingress = {
          "gts.busygam.ing" = with config.services.gotosocial.settings; {
            service = "http://${bind-address}:${toString port}";
          };
        };
      };
    };
  }
