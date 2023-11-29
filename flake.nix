{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-artwork = { url = "github:NixOS/nixos-artwork"; flake = false; };
    nixpkgs-with-inter-v4.url = "github:SharzyL/nixpkgs/inter_4";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    # Home Manager
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Web Experience!

    # Firefox Nightly
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme/nightly"; flake = false; }; # Firefox Gnome
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      channels-config.allowUnfree = true;
      namespace = "me";
      package-namespace = "me";
      src = ./.;

      # Funnybox NixOS system modules
      systems.hosts.funnybox = with inputs; [
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
}
