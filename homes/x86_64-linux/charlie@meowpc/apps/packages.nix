{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
    whois
    dunst
  ];
}