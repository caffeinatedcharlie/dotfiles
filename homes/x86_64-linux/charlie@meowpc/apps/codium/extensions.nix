{ extensions, pkgs }:

builtins.concatLists (builtins.attrValues {
  fullstack = with extensions; [
    astro-build.astro-vscode
    svelte.svelte-vscode
    marko-js.marko-vscode
    dtsvet.vscode-wasm
  ];
  nix = with extensions; [
    jnoortheen.nix-ide
  ];
  zig = with extensions; [
    ziglang.vscode-zig
  ];
  rust = with extensions; [
    pkgs.vscode-extensions.rust-lang.rust-analyzer
    tamasfe.even-better-toml
  ];
  ts = with extensions; [
    yoavbls.pretty-ts-errors
  ];
  git = with extensions; [
    maattdd.gitless
    mhutchie.git-graph
    vivaxy.vscode-conventional-commits
  ];
  code = with extensions; [
    bierner.emojisense
    esbenp.prettier-vscode
    pkgs.vscode-extensions.github.vscode-pull-request-github
    ultram4rine.vscode-choosealicense
    usernamehw.errorlens
    exodiusstudios.comment-anchors
    leonardssh.vscord
    antiantisepticeye.vscode-color-picker
    ms-vscode.hexeditor
    ms-vscode.live-server
  ];
  roblox = with extensions; [
    evaera.vscode-rojo
    evaera.roblox-api-explorer
    roblox-ts.vscode-roblox-ts
    nightrains.robloxlsp
  ];
  themes = with extensions; [
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
  ];
  other = with extensions; [
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];
})
