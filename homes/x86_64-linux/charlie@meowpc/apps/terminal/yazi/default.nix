{ pkgs, ... }:

{
  imports =
    [
      ./theme.nix
    ];

  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {
      withFile = true;
      withJq = true;
      withPoppler = true;
      withUnar = true;
      withFfmpegthumbnailer = true;
      withFd = true;
      withRipgrep = true;
      withFzf = true;
      withZoxide = true;
    };
    enableNushellIntegration = true;
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
