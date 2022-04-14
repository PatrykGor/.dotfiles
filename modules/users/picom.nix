{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    services.picom = {
      enable = true;
      /* package = pkgs.unstable.picom; */

      experimentalBackends = true;
      blur = true;
      # fade = true;
      # shadow = true;

      extraOptions =
        ''
          # corner-radius = 15;

          # blur-method = "dual_kawase";
          blur-strength = 7;
        '';
    };
  };
}

