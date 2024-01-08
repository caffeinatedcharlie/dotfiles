# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  home-manager.useUserPackages = true; # "This is necessary if, for example, you wish to use `nixos-rebuild build-vm`" ―https://nix-community.github.io/home-manager/#:~:text=use%20nixos-rebuild-,build-vm,-.%20This%20option%20may
  home-manager.useGlobalPkgs = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hppro3500"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure SSH
  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "no";
  };

  programs.mosh.enable = true;

  nix = {
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html
    settings = {
      # How to update this array later: Go to https://nixos.org/manual/nix/stable/contributing/experimental-features#currently-available-experimental-features
      # and run `copy(JSON.stringify($$("#currently-available-experimental-features ~ h2").map(h2 => h2.textContent), null, 2).replaceAll(",", ""))`
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      use-xdg-base-directories = false; # Some bug makes $PATH not update to the new directories so for now I'm disabling this
      auto-optimise-store = true;
      log-lines = 10000000;
    };
    # https://github.com/Nyabinary/dotfiles/blob/4491af8ecc54fdd65ae4af7906080208682b15c9/hosts/default.nix#L30-L34
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs; # https://github.com/NixOS/nix/pull/6530, "incompatible changes"
  };
  system.autoUpgrade = {
    enable = true;
    flags = [
      "--flake"
      "github:caffeinatedcharlie/dotfiles#hppro3500"
      "--print-build-logs" # print build logs
      "--fast"
    ];
    dates = "daily";
    randomizedDelaySec = "45min";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
