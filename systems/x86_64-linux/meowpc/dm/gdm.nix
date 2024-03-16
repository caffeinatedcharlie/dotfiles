{ inputs, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
    };
  };
  security.pam.services.gdm.enableGnomeKeyring = true;
}
