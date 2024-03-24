{ pkgs, lib, ... }:
let
  mainMod = "SUPER";
  mainModS = "SUPER_SHIFT";
  mainModC = "SUPER_CTRL";
  launchMod = "ALT";
  launchModS = "ALT_SHIFT";
  ctrlMod = "CTRL";
  ctrlModS = "CTRL_SHIFT";
in
[
  # Launcher
  "${mainMod}, D, exec, ${lib.getExe pkgs.wofi} --show drun"

  # Applications
  "${launchMod}, T, exec, ${lib.getExe pkgs.kitty}"
  "${launchMod}, Q, exec, ${lib.getExe pkgs.firefox}"
  "${launchMod}, C, exec, ${lib.getExe pkgs.vscodium}"
  "${launchMod}, X, exec, ${lib.getExe pkgs.gnome.nautilus}"
  "${launchMod}, D, exec, ${lib.getExe pkgs.vesktop}"

  # Screenshot
  ", Print, exec, ${lib.getExe (pkgs.callPackage ./scripts/screenshot.nix {})}"
  "${mainMod}, Print, exec, ${lib.getExe (pkgs.callPackage ./scripts/screenshot-window.nix {})}"

  # Color picker
  "${ctrlModS}, I, exec, ${lib.getExe pkgs.hyprpicker} -n -r -a"

  # Movement controls

  # Move focus with mainMod +  arrow keys

  "${mainMod}, left, movefocus, l"
  "${mainMod}, right, movefocus, r"
  "${mainMod}, up, movefocus, u"
  "${mainMod}, down, movefocus, d"

  # Move windows with mainMod + shift + arrow keys

  "${mainModS}, left, movewindow, l"
  "${mainModS}, right, movewindow, r"
  "${mainModS}, up, movewindow, u"
  "${mainModS}, down, movewindow, d"

  # Floating windows

  "${mainMod}, space, togglefloating"

  # Special Workspace

  "${mainMod}, Z, togglespecialworkspace,"
  "${mainMod}, X, movetoworkspacesilent,special"

  # Move out of special workspace, then close it

  "${mainMod}, C, movetoworkspace,e+0"

  # Switch workspaces with mainMod + [0-9]

  "${mainMod}, 1, workspace, 1"
  "${mainMod}, 2, workspace, 2"
  "${mainMod}, 3, workspace, 3"
  "${mainMod}, 4, workspace, 4"
  "${mainMod}, 5, workspace, 5"
  "${mainMod}, 6, workspace, 6"
  "${mainMod}, 7, workspace, 7"
  "${mainMod}, 8, workspace, 8"
  "${mainMod}, 9, workspace, 9"
  "${mainMod}, 0, workspace, 10"

  # Move active window to a workspace with mainMod + SHIFT + [0-9]

  "${mainModS}, 1, movetoworkspacesilent, 1"
  "${mainModS}, 2, movetoworkspacesilent, 2"
  "${mainModS}, 3, movetoworkspacesilent, 3"
  "${mainModS}, 4, movetoworkspacesilent, 4"
  "${mainModS}, 5, movetoworkspacesilent, 5"
  "${mainModS}, 6, movetoworkspacesilent, 6"
  "${mainModS}, 7, movetoworkspacesilent, 7"
  "${mainModS}, 8, movetoworkspacesilent, 8"
  "${mainModS}, 9, movetoworkspacesilent, 9"
  "${mainModS}, 0, movetoworkspacesilent, 10"

  # Scroll through existing workspaces with mainMod + scroll

  "${mainMod}, mouse_down, workspace, e+1"
  "${mainMod}, mouse_up, workspace, e-1"

  # Log out

  "${mainModS}, E, exit,"

  # Volume keys

  ",xf86audioraisevolume,exec,${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-volume @DEFAULT_SINK@ +5%"
  ",xf86audiolowervolume,exec,${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-volume @DEFAULT_SINK@ -5%"
  ",xf86audiomute,exec,${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-mute @DEFAULT_SINK@ toggle"
  ",xf86audiomicmute,exec,${lib.getExe' pkgs.pulseaudio "pactl"} set-source-mute @DEFAULT_SINK@ toggle"

  # Player keys

  ",xf86audioplay,exec,${lib.getExe pkgs.playerctl} play-pause"
  ",xf86audiopause,exec,${lib.getExe pkgs.playerctl} play-pause"
]
