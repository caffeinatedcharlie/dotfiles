{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.gnupg
    pkgs.armcord
    pkgs.me.nix-gear-wallpaper
  ];
}
