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
}
