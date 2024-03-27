{ inputs, pkgs, system, lib, ... }:

{
  imports =
    [
      ./nix.nix
      ./apps
      ./utility
      ./hyprland
      ./mime.nix
      # ./env.nix
    ];

  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "23.05";
}
