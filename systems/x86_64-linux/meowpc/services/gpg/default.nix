{ pkgs, ... }:

{
  services.dbus.packages = [ pkgs.gcr ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  programs.ssh.startAgent = true;
}
