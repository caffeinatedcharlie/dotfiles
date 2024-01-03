{ inputs, pkgs, system, lib, ... }: {
  programs = {
    firefox.enable = true;
    vscode.enable = true;
    nix-index-database.comma.enable = true;
    nushell = {
      enable = true;
      shellAliases = {
        switch = "sudo nixos-rebuild switch --fast --print-build-logs";
        nx = "nix develop --command hx";
        nv = "nix develop --command code";
        gc = "sudo nix-collect-garbage -d";
      };
      extraConfig = "$env.config.show_banner = false;";
    };
    git = {
      enable = true;
      userName = "caffeinatedcharlie";
      userEmail = "git@downgraded.uk";
      extraConfig = {
        core.editor = "code --wait";
        init.defaultBranch = "main";
        commit.gpgsign = true;
        user.signingkey = "~/.ssh/id_ed25519.pub";
        gpg.format = "ssh";
      };
    };
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "github_dark";
        editor = {
          bufferline = "multiple";
          auto-save = true;
          gutters = [ "diagnostics" "line-numbers" "diff" ];
          cursorline = true;
          color-modes = true;
          indent-guides.render = true;
          lsp.display-messages = true;
        };
      };
    };
  };
}
