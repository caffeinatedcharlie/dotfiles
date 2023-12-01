# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  services.flatpak.deduplicate = false;
  services.flatpak.remotes = {
    "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
  };
  services.flatpak.packages = [
    "flathub:app/org.gnome.design.IconLibrary/x86_64/stable" # Icon Libary (GNOME symbolic icon library)
    "flathub:app/org.gnome.design.Emblem/x86_64/stable" # Emblem (Use symbolic SVG's to generate logos)
    "flathub:app/org.gnome.Fractal/x86_64/stable" # Fractal (Matrix client)
    "flathub:app/com.github.neithern.g4music/x86_64/stable" # G4Music (Music player)
    "flathub:app/app.drey.Biblioteca/x86_64/stable" # Bibliotecha (GNOME documentation reader)
    "flathub:app/io.gitlab.adhami3310.Impression/x86_64/stable" # Impression (Bootable USB maker)
    "flathub:app/io.missioncenter.MissionCenter/x86_64/stable" # Mission Center (View system resource usage)
    "flathub:app/com.github.johnfactotum.QuickLookup/x86_64/stable" # Quick Lookup (Lookup words quickly with the dictionary)
    "flathub:app/com.github.johnfactotum.Foliate/x86_64/stable" # Foliate (E-Book Reader)
    "flathub:app/info.febvre.Komikku/x86_64/stable" # Komikku (Manga reader)
    "flathub:app/de.haeckerfelix.Fragments/x86_64/stable" # Fragments (BitTorrent client)
    "flathub:app/com.pojtinger.felicitas.Multiplex/x86_64/stable" # Multiplex (Watch torrents with your friends)
    "flathub:app/io.mpv.Mpv/x86_64/stable" # MPV (Video player (installed for Multiplex))
    "flathub:app/com.github.unrud.VideoDownloader/x86_64/stable" # Video Downloader (self explanatory)
    "flathub:app/com.usebottles.bottles/x86_64/stable" # Bottles (Run Windows software on Linux)
    "flathub:app/com.vysp3r.ProtonPlus/x86_64/stable" # ProtonPlus (Wine and Proton-based compatibility tools manager)
  ];
}

