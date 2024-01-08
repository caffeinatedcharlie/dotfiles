# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  services.dendrite = {
    enable = true;
    settings = {
      sync_api.search.enable = true;
      global = {
        server_name = "downgraded.uk";
        private_key = "/matrix/matrix_key.pem";
      };
    };
  };
}
