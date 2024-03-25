{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "nvidia-unload";

  runtimeInputs = with pkgs; [ kmod libvirt ];

  text = ''
    #!/bin/bash -e

    sudo modprobe -r nvidia_drm
    sudo modprobe -r nvidia_modeset
    sudo modprobe -r i2c_nvidia_gpu
    sudo modprobe -r nvidia_uvm
    sudo modprobe -r nvidia

    sudo virsh nodedev-detach pci_0000_01_00_0
    sudo virsh nodedev-detach pci_0000_01_00_1

    echo "NVIDIA drivers successfully unloaded!"
  '';
}
