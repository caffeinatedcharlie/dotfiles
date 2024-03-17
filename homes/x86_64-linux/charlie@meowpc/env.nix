{ pkgs, lib, ... }:

{
  home.file.".profile" = {
    executable = true;
    force = true;
    text = ''
      #!${lib.getExe pkgs.bash}
      source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    '';
  };
}
