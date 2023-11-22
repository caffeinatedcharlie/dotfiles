# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  # Enable flatpak support
  services.flatpak.enable = true;

  # Custom fonts in Flatpak applications <https://github.com/NixOS/nixpkgs/issues/119433#issuecomment-1326957279>
  system.fsPackages = [ pkgs.bindfs ];
  fileSystems =
    let
      mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
      };
      aggregatedFonts = pkgs.buildEnv {
        name = "system-fonts";
        paths = config.fonts.packages;
        pathsToLink = [ "/share/fonts" ];
      };
    in
    {
      # Create an FHS mount to support flatpak host icons/fonts
      "/usr/share/icons" = mkRoSymBind (config.system.path + "/share/icons");
      "/usr/share/fonts" = mkRoSymBind (aggregatedFonts + "/share/fonts");
    };

  # Flatpak declarative config

  # services.flatpak.remotes = {
  #   "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  # };

  # Updating flatpaks settings

  services.flatpak.update.onActivation = true;

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly"; # Default value
  };

  services.flatpak.packages = [
    "io.github.MakovWait.Godots"
    "com.github.micahflee.torbrowser-launcher"
    "org.gnome.design.IconLibrary"
    "org.gnome.design.Emblem"
    "de.haeckerfelix.Fragments"
    "com.pojtinger.felicitas.Multiplex"
    "io.mpv.Mpv"
    "io.gitlab.zehkira.Monophony"
    "io.github.vinegarhq.Vinegar"
    "info.febvre.Komikku"
    "com.github.johnfactotum.Foliate"
  ];
}

