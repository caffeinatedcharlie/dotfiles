{ pkgs, lib, ... }:

pkgs.writeShellApplication {
  name = "screenshot-bind";

  runtimeInputs = with pkgs; [ satty grim ];

  text = ''
    grim - | satty --filename - --initial-tool="crop" --early-exit --copy-command="wl-copy"
  '';
}
