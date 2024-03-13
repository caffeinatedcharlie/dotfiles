{ inputs, pkgs, system, lib, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = system;
    config.allowUnfree = true;
  };
in
{
  imports =
    [
      ./terminal
      ./browser
      ./codium
    ];

  home.packages = with unstable; [
    whois
    exiftool
  ];
}
