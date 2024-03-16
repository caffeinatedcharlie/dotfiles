{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.self.packages.${pkgs.system}.catppuccin-sddm
  ];
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
    };
  };
  security.pam.services.sddm.enableGnomeKeyring = true;
}
