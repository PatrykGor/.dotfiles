{ config, pkgs, lib, ... }:
with lib;

let
  colorCfg = config.patryk.colors;
in
{
  config = {
    xdg.configFile.rofi = {
      recursive = true;
      source = ./config;
      target = "rofi";
    };

    xdg.configFile.rofiTheme = {
      text =
        ''
          * {
            bg: ${colorCfg.bg};
            fg: ${colorCfg.fg};
            bgAlt: ${colorCfg.bright.black};
            button: ${colorCfg.primary};
            background-color: @bg;
            text-color: @fg;
          }
        '';

      target = "rofi/Themes/style.rasi";
    };
  };
}
