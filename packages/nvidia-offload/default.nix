{ lib, inputs, pkgs, stdenv, ... }:

pkgs.writeShellApplication
{
  name = "nvidia-offload";

  runtimeInputs = with pkgs; [ glxinfo ];

  text = ''
    #!/bin/bash

    case "$@" in
    	""|"--help"|"-help"|"-h")
    		echo "This script only launches the command you write after.
    Example:
    	nvidia-offload glxinfo | grep OpenGL
    It should show you video driver in use."
    exit 0
    esac

    export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/10_nvidia.json
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER="NVIDIA-G0"
    export __GLX_VENDOR_LIBRARY_NAME="nvidia"
    export __VK_LAYER_NV_optimus="NVIDIA_only"
    export VK_ICD_FILENAMES=/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json

    exec "$@"
  '';
}
