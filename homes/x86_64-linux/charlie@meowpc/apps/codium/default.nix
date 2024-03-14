{ inputs, pkgs, config, lib, ... }:

{
  # LSP, see https://github.com/microsoft/vscode/issues/188612 for when I can stop installing these globally
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];
  home.file.".vscode-oss/argv.json" = {
    force = true;
    text = builtins.toJSON {
      password-store = "gnome";
      enable-crash-reporter = false;
      enable-proposed-api = [
        "jeanp413.open-remote-ssh"
      ];
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    # https://github.com/nix-community/home-manager/issues/4394#issuecomment-1712909231
    mutableExtensionsDir = false;
    userSettings = import ./settings.nix;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      (lib.me.mkOpenVSXExt {
        publisher = "jeanp413";
        name = "open-remote-ssh";
        version = "0.0.45";
        sha256 = "1qc1qsahfx1nvznq4adplx63w5d94xhafngv76vnqjjbzhv991v2";
      })
    ] ++ pkgs.callPackage ./extensions.nix {
      extensions = (inputs.vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscodium.version).vscode-marketplace;
    };
  };
}
