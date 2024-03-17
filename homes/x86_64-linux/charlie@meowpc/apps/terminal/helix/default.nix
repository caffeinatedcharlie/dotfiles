{
  imports =
    [
      ./theme.nix
    ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      keys = import ./keys.nix;
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
}
