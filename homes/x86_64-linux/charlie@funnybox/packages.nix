{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    pkgs.gnupg
    pkgs.me.nix-gear-wallpaper
  ];
}
