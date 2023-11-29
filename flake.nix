{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme/nightly"; flake = false; };
    nixos-artwork = { url = "github:NixOS/nixos-artwork"; flake = false; };
    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    flatpaks.url = "github:gmodena/nix-flatpak";
    nixpkgs-with-inter-v4.url = "github:SharzyL/nixpkgs/inter_4";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      channels-config.allowUnfree = true;
      namespace = "me";
      package-namespace = "me";
      src = ./.;
      systems.hosts.funnybox = with inputs; [
        flatpaks.nixosModules.nix-flatpak
      ];
    };
}
