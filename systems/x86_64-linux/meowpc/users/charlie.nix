{ config, pkgs, inputs, ... }:

{
  users.users.charlie = {
    # My user account
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "video" "audio" "podman" "postgres" ];
    initialHashedPassword = "$y$j9T$ajJkU9entxo2ivw./lvmN1$xWO8PSHNbhepefmmSsyXKC4mZ3wuucOB1sz7QuQi6pB";
    shell = pkgs.nushell;
  };
}
