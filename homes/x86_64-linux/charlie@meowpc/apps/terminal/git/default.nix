{
  programs.git = {
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
}
