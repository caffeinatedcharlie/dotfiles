{ config, pkgs, lib, ... }:

let
  cfg = config.programs.virt-manager;
in
{
  config = lib.mkIf cfg.enable
    {
      virtualisation.spiceUSBRedirection.enable = true;
      virtualisation.kvmfr = {
        enable = true;
        devices = [
          {
            size = 128;
            permissions = {
              user = "charlie";
              group = "libvirtd";
            };
          }
        ];
      };
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [ pkgs.OVMFFull.fd ];
        };
      };
    };
}
