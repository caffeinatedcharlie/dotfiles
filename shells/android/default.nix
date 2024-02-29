{ pkgs, ... }:


pkgs.mkShell {
  packages = [
    pkgs.android-tools # Install ADB and Fastboot
    pkgs.lz4 # Samsung Firmware archives use LZ4 for like triple compression paired with the ZIP and the TAR (lol)
    pkgs.heimdall-gui # Heimdall is a CLI and GUI tool for flashing the firmware in Downloader mode on Samsung phones
  ];
}
