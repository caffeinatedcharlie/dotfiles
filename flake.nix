{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-std.url = "github:chessai/nix-std";
    nix-software-center.url = "github:vlinkz/nix-software-center"; # Nix Software Center
    nixos-artwork = { url = "github:NixOS/nixos-artwork"; flake = false; };
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

    # Server inputs

    conduit = {
      url = "gitlab:famedly/conduit";

      # Assuming you have an input for nixpkgs called `nixpkgs`. If you experience
      # build failures while using this, try commenting/deleting this line. This
      # will probably also require you to always build from source.
      inputs.nixpkgs.follows = "nixpkgs";
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
      ];
      homes.users."charlie@funnybox".modules = with inputs; [
        jack5079.homeModules.vscode # Jack5079's vscode module
        nix-index-database.hmModules.nix-index # Comma
      ];

      # hppro3500
      systems.hosts.hppro3500.modules = with inputs; [
        jack5079.nixosModules.hardened
      ];
    };
}
