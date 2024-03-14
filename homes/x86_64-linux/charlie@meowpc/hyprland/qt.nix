{ pkgs, config, ... }:

{
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "kvantum";
      package = pkgs.catppuccin-kvantum;
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
      General.Theme = "Catppuccin-Mocha-Mauve";
    };

    "Kvantum/Catppuccin-Mocha-Mauve".source = "${pkgs.graphite-kde-theme}/share/Kvantum/Catppuccin-Mocha-Mauve";
  };
}
