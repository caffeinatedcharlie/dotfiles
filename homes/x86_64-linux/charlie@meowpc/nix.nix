{ inputs, system, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = system;
    config.allowUnfree = true;
  };
in
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        unstable = unstable;
      })
    ];
  };
}
