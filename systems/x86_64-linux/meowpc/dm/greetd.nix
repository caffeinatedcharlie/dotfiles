{ inputs, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "charlie";
      };
    };
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
}
