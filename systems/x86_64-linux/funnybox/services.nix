# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  # PODMAN
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    enableNvidia = true;
  };
  services.flatpak.enable = true; # Flatpak
  # Enable Mullvad
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
  programs.virt-manager.enable = true; # Enable virt-manager
  programs.hyprland.enable = true;
  # Enable Steam and related things
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
  programs.gamemode.enable = true;
  # Globally installed packages
  environment.systemPackages = [
    pkgs.mangohud # MangoHud overlay
    pkgs.yubikey-manager-qt # YubiKey manager
  ];
  # ADB
  programs.adb.enable = true;
  # YubiKey
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}

