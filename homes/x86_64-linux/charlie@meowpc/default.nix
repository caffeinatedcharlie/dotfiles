{ inputs, pkgs, system, lib, ... }:

{
  imports =
    [
      ./apps
      ./hyprland
      ./env.nix
    ];

  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "23.05";
}
