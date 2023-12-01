# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  services.flatpak.remotes = {
    "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
  };
  services.flatpak.packages = [
    "flathub:app/com.github.unrud.VideoDownloader/x86_64/stable"
  ];
}

