{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.armcord
    pkgs.beeper
    pkgs.monophony
    pkgs.komikku
    pkgs.foliate
    pkgs.fragments
    pkgs.me.nix-gear-wallpaper
  ];
}