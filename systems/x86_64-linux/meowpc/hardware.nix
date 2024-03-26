{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPatches = [
    {
      name = "skippatcheck";
      patch = "${./pat.patch}";
    }
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "amd_iommu=on" "skippatcheck" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ ];
  services.xserver.videoDrivers = [ "nvidia" ];

  zramSwap.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents.

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = false;
      };

      amdgpuBusId = "PCI:16:00:0";
      nvidiaBusId = "PCI:01:00:0";
    };

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = false; # me when wayland

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.enableAllFirmware = true;

  # Filesystems

  services.fstrim.enable = true;
  boot.supportedFilesystems = [ "bcachefs" "ext4" "btrfs" "vfat" "ntfs" ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/db57de03-3486-48d8-8018-c3d4b309c10f";
      fsType = "bcachefs";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/27DC-6307";
      fsType = "vfat";
    };

  # Me when they fail to mount this partition for seemingly no reason at all :sob:

  # fileSystems."/home" =
  #   {
  #     device = "/dev/disk/by-partuuid/fdc75711-559a-4908-9eda-5a912a6440b4:/dev/disk/by-partuuid/8209bc50-fb37-432c-b137-13d97ad65478:/dev/disk/by-partuuid/3ddfb494-022b-44c9-9f3e-e13c7985b847";
  #     fsType = "bcachefs";
  #   };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/40b6fb4e-efa4-4203-bcf5-0d9a4bb1b257"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp7s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
