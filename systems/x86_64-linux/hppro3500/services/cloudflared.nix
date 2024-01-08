# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "b19c49d0-5cba-46d2-9afc-cd09ca64b451" = {
        # Conduit Matrix server
        credentialsFile = "/cloudflared/credentials/b19c49d0-5cba-46d2-9afc-cd09ca64b451.json";
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
