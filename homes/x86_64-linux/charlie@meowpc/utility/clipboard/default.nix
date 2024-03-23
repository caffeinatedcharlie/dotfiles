{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    wl-clip-persist
    wl-clipboard
    cliphist
  ];

  systemd.user.services.cliphist-text = {
    Unit = {
      Description = "Clipboard management daemon for text";
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart =
        "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${lib.getExe pkgs.cliphist} store";
      Restart = "on-failure";
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };
  };
  systemd.user.services.cliphist-image = {
    Unit = {
      Description = "Clipboard management daemon for images";
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart =
        "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${lib.getExe pkgs.cliphist} store";
      Restart = "on-failure";
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };
  };
}
