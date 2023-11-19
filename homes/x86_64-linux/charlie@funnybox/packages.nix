{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.armcord
    pkgs.beeper
    pkgs.me.nix-gear-wallpaper
  ];
}