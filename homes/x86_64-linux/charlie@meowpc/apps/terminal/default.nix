{
  imports =
    [
      ./nushell
      ./yazi
      ./helix
    ];
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.8";
      # remember_window_size = true;
      window_logo_path = "none";
    };
    theme = "Catppuccin-Mocha";
    font = {
      name = "Monaspice Nerd Font";
      size = 11;
    };
  };
}
