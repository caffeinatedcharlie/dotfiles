{ config, pkgs, inputs, ... }:

{
  # Configure the session variables
  environment.sessionVariables = rec {
    # NVIDIA Prime offloading variables (Tells every app to use my iGPU unless I specially instruct it not to (I would have to use the `nvidia-offload` command))
    "__EGL_VENDOR_LIBRARY_FILENAMES" = "/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json";
    "__GLX_VENDOR_LIBRARY_NAME" = "mesa";
    "VK_ICD_FILENAMES" = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
    "NIXOS_OZONE_WL" = "1"; # Tells applications to use Wayland by default
    "NIXPKGS_ALLOW_UNFREE" = "1"; # Allow unfree packages (Not necessary just incase)
  };
}
