{ inputs, pkgs, system, lib, ... }: {
  imports =
    [
      # Include the packages.
      ./packages.nix
      # Include the program settings.
      ./programs.nix
    ];

  home.stateVersion = "23.05";
}
