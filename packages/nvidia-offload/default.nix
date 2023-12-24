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

pkgs.writeShellScriptBin "nvidia-offload" ''
  #!/bin/bash

  case "$@" in
  	""|"--help"|"-help"|"-h")
  		echo "This script only launches the command you write after.
  Example:
  	prime glxinfo | grep OpenGL
  It should show you video driver in use."
  exit 0
  esac

  __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/10_nvidia.json __NV_PRIME_RENDER_OFFLOAD=1 __NV_PRIME_RENDER_OFFLOAD_PROVIDER="NVIDIA-G0" __GLX_VENDOR_LIBRARY_NAME="nvidia" __VK_LAYER_NV_optimus="NVIDIA_only" VK_ICD_FILENAMES=//run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json exec "$@"
''
