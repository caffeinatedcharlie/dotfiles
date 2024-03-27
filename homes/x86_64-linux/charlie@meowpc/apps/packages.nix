{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.self.packages.${pkgs.system}.nvidia-offload
    inputs.self.packages.${pkgs.system}.nvidia-unload
    inputs.self.packages.${pkgs.system}.nvidia-load
    mpv
    swww
    whois
    nextcloud-client
  ];
}
