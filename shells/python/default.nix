{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.python3Full
    pkgs.python311Packages.pip
  ];
}
