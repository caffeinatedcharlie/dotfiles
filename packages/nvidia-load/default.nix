{
  # Snowfall Lib provides a customized `lib` instance with access to your flake's library
  # as well as the libraries available from your flake's inputs.
  lib
, # You also have access to your flake's inputs.
  inputs
, # All other arguments come from NixPkgs. You can use `pkgs` to pull packages or helpers
  # programmatically or you may add the named attributes as arguments here.
  pkgs
, stdenv
, ...
}:

pkgs.writeShellApplication {
  name = "nvidia-load";

  runtimeInputs = with pkgs; [ kmod libvirt ];

  text = ''
    #!/bin/bash

    sudo udevadm trigger -w -v --type=devices --action=add /sys/bus/pci/devices/0000:01:00.0

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
