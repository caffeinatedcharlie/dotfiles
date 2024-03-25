{ config, pkgs, inputs, ... }:

{
  users.users.charlie = {
    # My user account
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "disk" "video" "audio" "podman" "postgres" ];
    initialHashedPassword = "$y$j9T$uv6Pt7Z9PCbv5/oTDZfxJ.$/8lHSMxbphjCJsbcdh.XQnIAOp/1U0Aeg7tooKnt8w0";
    shell = pkgs.nushell;
  };
}
