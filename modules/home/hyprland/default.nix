{ lib, osConfig, pkgs, ... }:

{
  config = lib.mkIf osConfig.programs.hyprland.enable {
    wayland.windowManager.hyprland.enable = true;
  };
}
