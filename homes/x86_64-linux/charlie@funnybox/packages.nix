{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
    inputs.self.packages.${pkgs.system}.nvidia-offload
    inputs.self.packages.${pkgs.system}.nvidia-unload
    inputs.self.packages.${pkgs.system}.nvidia-load
    inputs.self.packages.${pkgs.system}.nix-gear-wallpaper
    pkgs.prismlauncher
    pkgs.fractal
    pkgs.impression
    pkgs.wike
    pkgs.foliate
    pkgs.komikku
    pkgs.fragments
    pkgs.tor-browser
  ];
}
