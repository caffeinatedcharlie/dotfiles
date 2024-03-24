{ inputs, pkgs, lib, ... }:

{
  imports =
    [
      ./cursor.nix
      ./qt.nix
      ./gtk.nix
    ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        ",highrr,auto,1"
      ];
      input = {
        kb_layout = "gb";

        follow_mouse = 1;

        sensitivity = 0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(9c42b1) rgb(fdec56) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
        inactive_opacity = 0.9;
      };
      animations = {
        enabled = true;
        bezier = [
          "bez, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, bez"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
      gestures = {
        # macOS style workspace switching
        workspace_swipe = true;
      };
      misc = {
        # Disables default wallpaper
        disable_hyprland_logo = true;
        # Variable Refresh Rate
        vrr = 1;
      };
      exec = import ./exec.nix { inherit pkgs lib; };
      bind = import ./binds.nix { inherit pkgs lib; };
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER_ALT, mouse:272, resizewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      # windowrulev2 = import ./rules.nix;
    };
  };
}
