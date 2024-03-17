{ pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "caffeinatedcharlie";
    userEmail = "git@downgraded.uk";
    attributes = [ "*.lockb binary diff=lockb" ];
    extraConfig = {
      core.editor = "code --wait";
      init.defaultBranch = "main";
      commit.gpgsign = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
      gpg.format = "ssh";
      diff.lockb = {
        textconv = lib.getExe pkgs.bun;
        binary = true;
      };
    };
  };
}
