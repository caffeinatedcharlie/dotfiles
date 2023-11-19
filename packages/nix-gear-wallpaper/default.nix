{ pkgs, lib, ... }:
pkgs.writeTextFile {
  name = "nix-gear-wallpaper";
  destination = "/share/gnome-background-properties/nix-gear.xml";
  text = ''
    <?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>NixOS Gear</name>
        <filename>${inputs.nixos-artwork}/wallpapers/nix-wallpaper-gear.png</filename>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#ffffff</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>
  '';

  meta = {
    description = "NixOS Gear wallpaper";
    homepage = "https://github.com/NixOS/nixos-artwork/pull/82";
    downloadPage = "https://github.com/NixOS/nixos-artwork/blob/master/wallpapers/nix-wallpaper-gear.png";
    license = lib.licenses.cc-by-sa-40; # https://github.com/NixOS/nixos-artwork/blob/master/CONTRIBUTORS.md#multisamplednight
    platforms = lib.platforms.all;
  };
}