{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "amd_iommu=on" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ kvmfr ];
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
    # nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.enableAllFirmware = true;

  # Filesystems

  # services.fstrim.enable = true;
  boot.supportedFilesystems = [ "bcachefs" "ext4" "btrfs" "vfat" "ntfs" ];

  # boot.initrd.luks.devices."luks-8cf2d39e-ba59-4190-8f21-07123bd185ba".device = "/dev/disk/by-uuid/8cf2d39e-ba59-4190-8f21-07123bd185ba";

  # fileSystems."/" =
  #   {
  #     device = "/dev/disk/by-uuid/ce73ccac-73b5-4fd2-a78e-33e5ae571757";
  #     fsType = "ext4";
  #   };

  # boot.initrd.luks.devices."luks-d10d2627-7922-4c1d-a488-125c142dffd6".device = "/dev/disk/by-uuid/d10d2627-7922-4c1d-a488-125c142dffd6";

  # fileSystems."/boot" =
  #   {
  #     device = "/dev/disk/by-uuid/8CF8-90A0";
  #     fsType = "vfat";
  #   };

  # swapDevices =
  #   [{ device = "/dev/disk/by-uuid/297a4e94-5be3-464f-8810-6c59a9ad6d32"; }];

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
