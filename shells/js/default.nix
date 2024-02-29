{ pkgs, ... }:

pkgs.mkShell {
  packages = [
    pkgs.bun # Bun runtime
    pkgs.nodejs_latest # NodeJS runtime + NPM
    pkgs.nodePackages_latest.pnpm # PNPM package manager
  ];
}
