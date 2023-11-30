{ config, lib, pkgs, ... }:

let
  cfg = config.programs.vesktop;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vesktop pkgs.arrpc ];

    systemd.user.services.arrpc-startup = {
      Unit = {
        Description = "arRPC startup";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = lib.getExe pkgs.arrpc;
      };
    };
  };
}
