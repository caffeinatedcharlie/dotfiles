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

pkgs.writeShellScriptBin "nvidia-unload" ''
  #!/bin/bash

  sudo modprobe -r nvidia_drm
  sudo modprobe -r nvidia_modeset
  sudo modprobe -r i2c_nvidia_gpu
  sudo modprobe -r nvidia_uvm
  sudo modprobe -r nvidia
  
  sudo virsh nodedev-detach pci_0000_01_00_0
  sudo virsh nodedev-detach pci_0000_01_00_1

  echo "NVIDIA drivers successfully unloaded!"
''
