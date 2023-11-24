{ inputs, pkgs, system, lib, ... }: {
  imports =
    [
      # Include the packages.
      ./packages.nix
      # Include the program settings.
      ./programs.nix
    ];

  home.stateVersion = "23.05";

  # arrpc service

  systemd.user.services.arrpc-startup = {
    Unit = {
      Description = "Discord RPC service on startup";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = lib.getExe pkgs.arrpc;
    };
  };
}
