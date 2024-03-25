{
  programs.atuin = {
    enable = true;
    settings = {
      dialect = "uk";
      style = "compact";
      show_preview = true;
      secrets_filter = true;
      common_prefix = [
        "sudo"
      ];
    };
  };
}
