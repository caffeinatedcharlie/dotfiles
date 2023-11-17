{ lib, osConfig, pkgs, ... }:

{
  config = lib.mkIf osConfig.services.xserver.desktopManager.gnome.enable {
    # GSConnect was installed in systems/x84_64-linux/mollerbot/phone.nix when I set programs.kdeconnect.package
    home.packages = with pkgs.gnomeExtensions; [
      tray-icons-reloaded
      hot-edge
      just-perfection
      paperwm
      overview-background
      wayland-or-x11
    ] ++ [
      pkgs.adw-gtk3
      pkgs.gnome.gnome-tweaks
    ];

    dconf.settings = {
      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = [ ]; # @as
        switch-applications-backward = [ ]; # @as
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Shift><Alt>Tab" ];
        toggle-fullscreen = [ "<Shift><Super>Return" ];
      };

      "org/gnome/shell/keybindings" = {
        screenshot-window = [ "<Super>Print" ];
        show-screenshot-ui = [ "Print" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        control-center = [ "<Super>i" ];
        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
        home = [ "<Super>e" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control>Escape";
        command = "gnome-system-monitor";
        name = "open task man";
      };

      "org/gnome/shell/extensions/paperwm/keybindings" = {
        switch-left = [ "<Super>Left" "<Super>comma" ];
        switch-next = [ "<Super>d" "<Super>period" ];
        switch-previous = [ "<Super>a" ];
        toggle-scratch = [ "<Super>s" ];
      };

      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "interactive";
        sleep-inactive-ac-type = "nothing";
      };

      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        dynamic-workspaces = true;
        edge-tiling = true;
        focus-change-on-pointer-rest = true;
        overlay-key = "Super_L";
        workspaces-only-on-primary = true;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        app-menu = false;
        power-icon = false;
        search = false;
        theme = true;
        top-panel-position = 1;
      };

    };
  };
}
