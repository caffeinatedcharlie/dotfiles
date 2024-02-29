{ config, pkgs, inputs, ... }:

{
  imports = [
    # Add fonts
    ./fonts.nix
    # Enable Desktop configuration
    ./hyprland
  ];
}
