{
  programs.looking-glass-client = {
    enable = true;
    settings = {
      app = {
        allowDMA = true;
        shmFile = "/dev/kvmfr0";
      };
    };
  };
}
