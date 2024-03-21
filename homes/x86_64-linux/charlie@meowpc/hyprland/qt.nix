{ pkgs, config, ... }:

{
  home.packages = with pkgs.kdePackages; [
    qtwayland
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
      General.theme = "Catppuccin-Mocha-Mauve";
    };

    "Kvantum/Catppuccin-Mocha-Mauve".source = "${pkgs.catppuccin-kvantum.override {
      accent = "Mauve";
      variant = "Mocha";
    }}/share/Kvantum/Catppuccin-Mocha-Mauve";
  };
}
