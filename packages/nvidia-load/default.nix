{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "nvidia-load";

  runtimeInputs = with pkgs; [ kmod libvirt ];

  text = ''
    #!/bin/bash -e

    sudo virsh nodedev-reattach pci_0000_01_00_0
    sudo virsh nodedev-reattach pci_0000_01_00_1

    sudo modprobe nvidia_drm
    sudo modprobe nvidia_modeset
    sudo modprobe i2c_nvidia_gpu
    sudo modprobe nvidia_uvm
    sudo modprobe nvidia

    echo "NVIDIA drivers successfully loaded!"
  '';
}
