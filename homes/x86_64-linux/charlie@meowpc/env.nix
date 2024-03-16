{ pkgs, ... }:

{
  home.file.".profile" = {
    executable = true;
    force = true;
    text = ''
      #!${pkgs.bash}/bin/bash
      source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    '';
  };
}
