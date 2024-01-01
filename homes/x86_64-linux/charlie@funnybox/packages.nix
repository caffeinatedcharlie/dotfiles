{ inputs, pkgs, system, lib, ... }: {
  home.packages = [
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
    inputs.self.packages.${pkgs.system}.nvidia-offload
    inputs.self.packages.${pkgs.system}.nvidia-unload
    inputs.self.packages.${pkgs.system}.nvidia-load
    inputs.self.packages.${pkgs.system}.nix-gear-wallpaper
    inputs.jack5079.packages.${pkgs.system}.vesktop-with-sane-icon
    pkgs.helvum
    pkgs.toolbox
    pkgs.prismlauncher-qt5
    pkgs.fractal
    pkgs.impression
    pkgs.wike
    pkgs.foliate
    pkgs.komikku
    pkgs.fragments
    pkgs.tor-browser
    pkgs.protonvpn-gui
  ];
}
