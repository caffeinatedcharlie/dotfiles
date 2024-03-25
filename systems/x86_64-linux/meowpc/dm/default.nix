{ inputs, pkgs, ... }:

{
  imports =
    [
      ./gdm.nix
    ];

  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];
}
