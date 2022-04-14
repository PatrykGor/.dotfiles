{ config, pkgs, lib, ... }:
with lib;

let
  colorCfg = config.patryk.colors;
  barCfg = config.patryk.bar;
  monitorCfg = conifg.patryk.monitors;
in
{
  options.patryk.monitors = {
    native = mkOption {
      description = "Native monitor data";
      type = types.attrs;
    };
    external = mkOption {
      description = "External monitor data";
      type = types.attrs;
    };
  };

  config = {
    xsession = {
      enable = true;
      numlock.enable = true;
      windowManager.bspwm = {
        enable = true;
        settings = {
          border_width = 4;
          window_gap = 5;

          presel_feedback = true;
          presel_feedback_color = colorCfg.primary;

          normal_border_color = colorCfg.bg;
          focused_border_color = colorCfg.primary;

          focus_follows_pointer = true;
          pointer_action1 = "move";
          pointer_action3 = "resize_corner";

          gapless_monocle = true;
          single_monocle = true;
          top_padding = barCfg.height + barCfg.border;
        };
        extraConfig = ''
          #Configure monitor specific setups:
          if xrandr -q | grep '${monitorCfg.external.name} connected'; then
              #External monitor is connected:
              bspc monitor ${monitorCfg.external.name} -d 1 2 3 4 5
              bspc monitor ${monitorCfg.native.name} -d 9 0
          else
              #Only laptop display:
              bspc monitor ${monitorCfg.native.name} -d 1 2 3 4 5 9 0
          fi

          #Always use 1 as default:
          bspc desktop -f 1
          # Testing terminal (can comment out if everything working)
          # alacritty
        '';
      };
    };
  };
}
