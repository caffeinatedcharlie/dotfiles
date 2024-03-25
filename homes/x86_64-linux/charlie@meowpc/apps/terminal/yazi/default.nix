{ inputs, pkgs, ... }:

{
  imports =
    [
      ./theme.nix
    ];

  programs.yazi = {
    enable = true;
    package = inputs.kittypkgs.packages.${pkgs.system}.yazi;
    keymap = import ./binds.nix;
    settings = {
      manager = {
        sort_by = "modified";
        sort_dir_first = true;
        linemode = "size";
        show_symlink = true;
        scrolloff = 20;
      };
      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
      };
      which = {
        sort_by = "key";
      };
    };
  };
}
