{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.vesktop
    pkgs.beeper
    pkgs.me.nix-gear-wallpaper
  ];
}