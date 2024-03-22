{ inputs, pkgs, system, lib, ... }:

{
  imports =
    [
      ./nix.nix
      ./apps
      ./hyprland
      ./env.nix
    ];

  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "23.05";
}
