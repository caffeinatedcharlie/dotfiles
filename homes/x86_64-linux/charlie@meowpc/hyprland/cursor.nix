{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Mauve-Cursors";
    package = pkgs.catppuccin-cursors.mochaMauve;
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };
}
