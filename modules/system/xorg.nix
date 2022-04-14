{ config, pkgs, lib, ... }:
with lib;

{
  config = {

    console.useXkbConfig = true;

    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;
      layout = "pl";
      xkbOptions = "caps:swapescape,altwin:swap_lalt_lwin";
      libinput.enable = true;

      displayManager.lightdm.enable = true;
      windowManager.bspwm.enable = true;

      displayManager.defaultSession = "none+bspwm";
      displayManager.autoLogin.enable = true;
      displayManager.autoLogin.user = "patryk";
    };
  };
}

