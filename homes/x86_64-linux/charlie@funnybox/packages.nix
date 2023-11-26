{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.arrpc
    pkgs.gnupg
    pkgs.vesktop
    pkgs.me.nix-gear-wallpaper
  ];
}
