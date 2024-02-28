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
