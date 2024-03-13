{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-std.url = "github:chessai/nix-std";
    hyprland.url = "github:hyprwm/Hyprland";
    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # We will handle this in the next section.
  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      channels-config = {
        allowUnfree = true;
      };
      namespace = "me";
      package-namespace = "me";
      snowfall.namespace = "me";
      src = ./.;

      # meowpc
      homes.users."charlie@meowpc".modules = with inputs; [
        nix-index-database.hmModules.nix-index
        arkenfox.hmModules.arkenfox
        hyprland.homeManagerModules.default
      ];
    };
}
