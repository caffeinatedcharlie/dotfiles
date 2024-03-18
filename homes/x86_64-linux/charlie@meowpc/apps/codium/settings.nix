{ pkgs, lib, ... }:

{
  "workbench.colorTheme" = "Catppuccin Mocha";
  "workbench.iconTheme" = "catppuccin-mocha";
  "editor.smoothScrolling" = true;
  "workbench.list.smoothScrolling" = true;
  "window.customTitleBarVisibility" = "auto";
  "window.titleBarStyle" = "custom";
  "files.autoSave" = "onFocusChange";
  "github.gitAuthentication" = false;
  "git.confirmSync" = false;
  "git.autofetch" = true;
  "editor.formatOnSave" = true;
  "editor.semanticHighlighting.enabled" = true;
  "editor.fontFamily" = "'Monaspace Neon Regular', 'DejaVu Sans Mono'";
  "terminal.integrated.fontFamily" = "monospace";
  "rpc.buttonEnabled" = true;
  "rpc.buttonInactiveLabel" = "";
  "rpc.buttonInactiveUrl" = "";
  "rpc.lowerDetailsDebugging" = "Debugging {file_name}:{current_line}:{current_column}";
  "rpc.detailsDebugging" = "In {workspace} {problems}";
  "rpc.smallImage" = "Codium";
  "nix.serverPath" = "${lib.getExe pkgs.nil}";
  "nix.formatterPath" = "${lib.getExe pkgs.nixpkgs-fmt}";
  "[javascript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[json]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[typescript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[html]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
}
