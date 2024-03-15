{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  environment.sessionVariables = rec {
    "XDG_CURRENT_DESKTOP" = "Hyprland";
    "XDG_SESSION_DESKTOP" = "Hyprland";
    "XDG_SESSION_TYPE" = "wayland";

    "QT_QPA_PLATFORM" = "wayland;xcb";
    "QT_QPA_PLATFORMSTYLE" = "qt5ct";
    "QT_STYLE_OVERRIDE" = "kvantum";
    "QT_AUTO_SCREEN_SCALE_FACTOR" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";

    "GDK_BACKEND" = "wayland,x11";
    "SDL_VIDEODRIVER" = "wayland";
    "CLUTTER_BACKEND" = "wayland";
  };
  security.polkit.enable = true;
}
