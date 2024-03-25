{ config, pkgs, ... }: {
  programs.gpg = {
    enable = true;
    settings = {
      default-key = config.programs.git.extraConfig.user.signingkey;
    };
  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 36000;
    maxCacheTtl = 36000;
    defaultCacheTtlSsh = 36000;
    maxCacheTtlSsh = 36000;
    enableSshSupport = true;
    pinentryFlavor = "gnome3";
  };
  programs.ssh.enable = true;
}
