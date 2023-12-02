{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
    pkgs.mission-center
    pkgs.tor-browser
    pkgs.gnupg
    pkgs.me.nix-gear-wallpaper
  ];
}
