{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    breeze-icons
    libsForQt5.plasma-integration
    libsForQt5.systemsettings
    kdePackages.qtwayland
  ];
  qt = {
    enable = true;
    platformTheme = "kde";
    style = {
      name = "kvantum";
      package = with pkgs; [ libsForQt5.qtstyleplugin-kvantum qt6Packages.qtstyleplugin-kvantum gnome.adwaita-icon-theme ];
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
