{ config, pkgs, inputs, ... }:

{
  imports = [
    # Import all the active user configurations
    ./charlie.nix
  ];

  users.mutableUsers = false;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
}
