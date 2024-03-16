{ inputs, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
      banner = '':3 is so cool'';
    };
  };
  security.pam.services.gdm.enableGnomeKeyring = true;
}
