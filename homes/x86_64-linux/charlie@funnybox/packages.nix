{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.mission-center
    pkgs.tor-browser
    pkgs.gnupg
    pkgs.me.nix-gear-wallpaper
  ];
}
