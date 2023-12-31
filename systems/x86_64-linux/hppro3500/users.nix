# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  users.mutableUsers = false;
  users.users.user = {
    # My user account
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$y$j9T$boMWYjGKnwVQ0sxwR.ofh.$CfOzCaBb93fOMBXYnykzXCzxFbYTJpGvni/mejZ3dK3";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjyJsQIi+dvl6nO3OfRLBGILFlNuNpqrFfKYprkbG0x"
    ];
  };
}
