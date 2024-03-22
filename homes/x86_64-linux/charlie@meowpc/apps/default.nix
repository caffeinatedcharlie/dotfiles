{ pkgs, ... }:
{
  imports =
    [
      ./terminal
      ./browser
      ./codium
    ];

  home.packages = with pkgs.unstable; [
    swww
    whois
  ];
}
