{ lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
}
