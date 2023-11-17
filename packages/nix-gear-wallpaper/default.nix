{ pkgs, lib, ... }:
pkgs.writeTextFile {
  name = "skylight-wallpaper";
  destination = "/share/gnome-background-properties/skylight.xml";
  text = ''
    <?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>NixOS Gear</name>
        <filename>${./nix-wallpaper-gear.png}</filename>
        <filename-dark>${./nix-wallpaper-gear.png}</filename-dark>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#ffffff</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>
  '';

  meta = {
    description = "NixOS Gear wallpaper";
    license = lib.licenses.cc-by-sa-40;
    platforms = lib.platforms.all;
  };
}