{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-software-center.url = "github:vlinkz/nix-software-center"; # Nix Software Center
    nixos-artwork = { url = "github:NixOS/nixos-artwork"; flake = false; };
    vscode-extensions.url = "github:nix-community/nix-vscode-extensions"; # Declaratively install VSCode extensions
    nix-flatpak.url = "github:GermanBread/declarative-flatpak/stable"; # Declaratively install Flatpaks
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

    # Inputs from other friends using NixOS

    jack5079 = {
      url = "github:jack5079/dotfiles";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      channels-config.allowUnfree = true;
      namespace = "me";
      package-namespace = "me";
      src = ./.;

      # Funnybox
      systems.hosts.funnybox.modules = with inputs; [
        jack5079.nixosModules.hardened # Jack5079's NixOS hardened module
        jack5079.nixosModules.virt-manager # Jack5079's Virt-Manager module
        nix-flatpak.nixosModules.default # Declaratively install Flatpaks
      ];
      homes.users."charlie@funnybox".modules = with inputs; [
        jack5079.homeModules.bun # Jack5079's bun module
      ];
    };
}
