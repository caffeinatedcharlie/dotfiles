{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include hardware configuration
      ./hardware.nix
      # Import Nix package manager configuration
      ./nix.nix
      # Import sound configuration
      ./sound.nix
      # Import configure session variables
      ./variables.nix
      # Import services
      ./services.nix
      # Import users
      ./users
      # Import desktop configuration
      ./desktop
    ];
  virtualisation.vmVariant = {
    services.qemuGuest.enable = true;
    boot = {
      kernelParams = [
        "nosplash"
        "systemd.show_status=true"
        "systemd.log_level=debug"
      ];
    };
    virtualisation = {
      qemu.options = [
        "-enable-kvm"
        "-display gtk,gl=on,zoom-to-fit=on,grab-on-hover=on"
        "-device virtio-vga-gl"
        "-device usb-mouse"
        "-device usb-tablet"
        "-device usb-kbd"
      ];
      diskSize = 16000;
      memorySize = 16384;
      cores = 12;
      writableStoreUseTmpfs = false;
    };
  };
  security.hardened = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "meowpc"; # Define your hostname.
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
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  # https://github.com/nix-community/srvos/blob/main/nixos/common/upgrade-diff.nix
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      if [[ -e /run/current-system ]]; then
        ${lib.getExe pkgs.nvd} --nix-bin-dir=${config.nix.package}/bin diff /run/current-system "$systemConfig"
      fi
    '';
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

