{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.tor-browser
    pkgs.gnupg
    pkgs.me.nix-gear-wallpaper
  ];
}
