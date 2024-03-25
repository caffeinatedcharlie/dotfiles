{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    history.size = 0;
    history.save = 0;
    history.path = "/dev/null"; # Me when atuin!

    shellAliases = {
      ll = "ls -l";
      switch = "sudo nixos-rebuild switch --fast";
      nx = "nix develop --command hx";
      nv = "nix develop --command code";
      gc = "sudo nix-collect-garbage -d";
      code = "codium";
      mount_data = "sudo mount -o user=1000 -t bcachefs /dev/disk/by-partuuid/fdc75711-559a-4908-9eda-5a912a6440b4:/dev/disk/by-partuuid/8209bc50-fb37-432c-b137-13d97ad65478:/dev/disk/by-partuuid/3ddfb494-022b-44c9-9f3e-e13c7985b847 /home/charlie/data";
    };

    antidote = {
      enable = true;
      plugins = [
        "romkatv/powerlevel10k"
      ];
    };

    initExtra = ''
      source ${./p10k.zsh}
    '';
  };
}
