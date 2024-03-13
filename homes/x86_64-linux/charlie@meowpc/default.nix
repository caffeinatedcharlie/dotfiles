{ inputs, pkgs, system, lib, ... }:

{
  imports =
    [
      ./apps
      ./hyprland
    ];

  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "23.05";
}
