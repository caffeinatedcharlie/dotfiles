{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.armcord
    pkgs.komikku
    pkgs.foliate
    pkgs.fragments
    pkgs.me.nix-gear-wallpaper
  ];
}