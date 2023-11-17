{ inputs, pkgs, system, lib, ... }: {
  home.stateVersion = "23.05";
  home.packages = [
    pkgs.arrpc
    pkgs.vesktop
    pkgs.beeper
    pkgs.me.nix-gear-wallpaper
  ];

  # arrpc service

  systemd.user.services.arrpc-startup = {
    Unit = {
      Description = "Discord RPC service on startup";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = lib.getExe pkgs.arrpc;
    };
  };

  programs = {
    firefox.enable = true;
    bun.enable = true;
    vscode.enable = true;
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
      userName = "charlieborin";
      userEmail = "148908691+charlieborin@users.noreply.github.com";
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
