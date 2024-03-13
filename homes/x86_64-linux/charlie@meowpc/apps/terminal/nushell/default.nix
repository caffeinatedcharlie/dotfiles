{
  programs.nushell = {
    enable = true;
    shellAliases = {
      switch = "sudo nixos-rebuild switch --fast";
      nx = "nix develop --command hx";
      nv = "nix develop --command code";
      gc = "sudo nix-collect-garbage -d";
    };
    extraConfig = ''
      $env.config.show_banner = false;
      $env.config.shell_integration = true;
      def show_banner [] {
        let kitty = [
          " /| ､      "
          "(°､ ｡ 7    "
          " |､  ~ヽ   "
          " じしf_,)/ "
        ]
        let s = (sys)
        print $"(ansi reset)(ansi blue_bold) ($s.host.name) (ansi white_bold)($s.host.os_version)(ansi reset)"
        print $"(ansi yellow_bold) Linux (ansi white_bold)($s.host.kernel_version)(ansi reset)"
        print $""
        print $"             (ansi light_blue)(whoami)(ansi white_bold)@(ansi reset)(ansi light_blue)($s.host.hostname)(ansi reset)"
        print $"(ansi green)($kitty.0)  (ansi yellow) (ansi yellow_bold)Nushell (ansi reset)(ansi yellow)v(version | get version)(ansi reset)"
        print $"(ansi green)($kitty.1)  (ansi light_blue) (ansi light_blue_bold)RAM (ansi reset)(ansi light_blue)($s.mem.used) / ($s.mem.total)(ansi reset)"
        print $"(ansi green)($kitty.2)  (ansi light_red) (ansi light_red_bold)Clock (ansi reset)(ansi light_red)(date now | date to-timezone local)(ansi reset)"
        print $"(ansi green)($kitty.3)  (ansi light_purple) (ansi light_purple_bold)Uptime (ansi reset)(ansi light_purple)($s.host.uptime)(ansi reset)"
        print $""
      }
      show_banner
    '';
  };
}
