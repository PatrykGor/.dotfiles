{ config, pkgs, lib, ... }:
with lib;

let
  colorCfg = config.patryk.colors;
in
{
  options.patryk.colors = {
    bg = mkOption {
      description = "Background color";
      type = types.str;
    };
    primary = mkOption {
      description = "Primary color (used for accents)";
      type = types.str;
    };
    fg = mkOption {
      description = "Foreground color";
      type = types.str;
    };
    normal = mkOption {
      description = "Normal base16 color palette";
      type = types.attrs;
    };
    bright = mkOption {
      description = "Bright base16 color palette";
      type = types.attrs;
    };
  };

  config = {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.8;
        };
        colors = {
          primary = {
            background = colorCfg.bg;
            foreground = colorCfg.fg;
          };
          normal = colorCfg.normal;
          bright = colorCfg.bright;
        };
      };
    };
  };
}

