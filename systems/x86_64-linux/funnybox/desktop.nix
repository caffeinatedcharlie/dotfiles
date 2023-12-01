# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-photos
    gnome.simple-scan
    gnome.gnome-maps
    gnome.geary
    gnome.cheese
    epiphany
    gnome.gnome-music
  ];
  # Fonts
  fonts = {
    packages = [ pkgs.inter pkgs.noto-fonts-cjk-sans pkgs.source-sans-pro pkgs.go-font pkgs.monaspace ];
    fontDir.enable = true;
    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" "Inter Regular" "Cantarell" "DejaVu Sans" ];
      monospace = [ "Go Mono" "DejaVu Sans Mono" ];
    };
  };
}
