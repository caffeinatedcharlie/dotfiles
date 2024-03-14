{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Mauve-Cursors";
    package = pkgs.catppuccin-cursors.mochaMauve;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
