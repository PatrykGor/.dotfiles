{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    # Enable sound.
    sound.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    # hardware.pulseaudio.enable = true;
  };
}
