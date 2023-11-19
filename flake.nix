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
    # jack5079 = {
    # 	url = "github:jack5079/dotfiles";
    # 	inputs = {
    # 		nixpkgs.follows = "nixpkgs";
    # 		home-manager.follows = "home-manager";
    # 	};
    # };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      channels-config.allowUnfree = true;
      namespace = "me";
      package-namespace = "me";
      src = ./.;
      # homes.modules = with inputs; [
      # 	jack5079.homeModules.bun
      # ];
    };
}
