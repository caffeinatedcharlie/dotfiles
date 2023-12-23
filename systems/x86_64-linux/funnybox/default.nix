# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware.nix
      # Desktop environment
      ./desktop.nix
      # Enable sound
      ./sound.nix
      # Global services
      ./services.nix
    ];

  boot.initrd.luks.devices."luks-c25a1380-a4c3-4abf-8458-ab6915b7dab4".device = "/dev/disk/by-uuid/c25a1380-a4c3-4abf-8458-ab6915b7dab4"; # LUKS

  security.hardened = true; # Enable NixOS hardening

  home-manager.useUserPackages = true; # "This is necessary if, for example, you wish to use `nixos-rebuild build-vm`" ―https://nix-community.github.io/home-manager/#:~:text=use%20nixos-rebuild-,build-vm,-.%20This%20option%20may
  home-manager.useGlobalPkgs = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "funnybox"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  
  # Set your time zone.
  time.timeZone = "Europe/London";
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

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
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs; # https://github.com/NixOS/nix/pull/6530, "incompatible changes"
  };

  users.mutableUsers = false;
  users.users.charlie = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "adbusers" ]; # Enable ‘sudo’ for the user.
    initialHashedPassword = "$y$j9T$ajJkU9entxo2ivw./lvmN1$xWO8PSHNbhepefmmSsyXKC4mZ3wuucOB1sz7QuQi6pB";
    shell = pkgs.nushell;
  };
  environment.shells = with pkgs; [ nushell ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

