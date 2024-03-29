{ config, pkgs, inputs, ... }:

{
  fonts = {
    packages = [
      pkgs.inter
      pkgs.noto-fonts-cjk-sans
      pkgs.source-sans-pro
      pkgs.go-font
      pkgs.monaspace
      (pkgs.nerdfonts.override {
        fonts = [ "Monaspace" ];
      })
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Inter Variable" "Inter Variable Regular" "Inter" "Inter Regular" "Cantarell" "DejaVu Sans" ];
        monospace = [ "MonaspiceNe Nerd Font" "Monaspace Neon Var" "Monaspace Neon Regular" "DejaVu Sans Mono" ];
      };
    };
  };
}
