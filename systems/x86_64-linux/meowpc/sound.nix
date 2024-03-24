{ pkgs, lib, modulesPath, ... }:

{
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
