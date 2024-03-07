{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
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
    };
}
