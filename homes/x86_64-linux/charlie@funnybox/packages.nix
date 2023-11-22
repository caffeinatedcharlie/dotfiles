{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.gnupg
    pkgs.armcord
    pkgs.komikku
    pkgs.foliate
    pkgs.fragments
    pkgs.me.nix-gear-wallpaper
  ];
}
