{ lib, osConfig, pkgs, ... }:

{
  config = lib.mkIf osConfig.programs.hyprland.enable {
    programs.hyprland = {
      # Whether to enable XWayland
      xwayland.enable = true;
    };
  };
}
