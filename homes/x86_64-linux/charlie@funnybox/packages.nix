{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
    pkgs.fractal
    pkgs.g4music
    pkgs.impression
    pkgs.wike
    pkgs.foliate
    pkgs.komikku
    pkgs.fragments
    pkgs.tor-browser
    pkgs.gnupg
    pkgs.me.nix-gear-wallpaper
  ];
}
