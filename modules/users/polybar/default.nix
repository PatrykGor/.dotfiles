{ config, pkgs, lib, ... }:
with lib;

let
  scrollSpotify = pkgs.callPackage ./scroll_spotify_status.nix { };
  cfg = config.patryk.bar;
  colorCfg = config.patryk.colors;
  hardwareCfg = config.machineData.hardware;
in
{
  options.patryk.bar = {
    height = {
      description = "Bar height in pixels";
      type = types.float;
    };
    border = {
      description = "Bar border width in pixels";
      type = types.float;
    };
  };

  options.machineData.hardware = {
    power = {
      description = "Battery and adapter data";
      type = types.attrs;
    };
  };

  config = {
    services.polybar = {
      enable = true;
      /* package = pkgs.unstable.polybarFull; */
      script = ''
        # Terminate already running bar instances
        ${pkgs.killall}/bin/killall -q polybar
        # If all your bars have ipc enabled, you can also use
        # polybar-msg cmd quit

        # Launch bar
        for m in $(${pkgs.xorg.xrandr}/bin/xrandr --query | ${pkgs.gnugrep}/bin/grep " connected" | ${pkgs.coreutils}/bin/cut -d" " -f1); do
            MONITOR=$m polybar --reload top &
        done

        echo "Bar launched..."
      '';
      settings = {
        "bar/top" = {
          monitor = "\${env:MONITOR:}";
          override.redirect = true;
          bottom = false;
          fixed.center = true;
          width = "100%";
          height = cfg.height;
          background = colorCfg.bg;
          foreground = colorCfg.fg;
          border.bottom.size = cfg.border;
          border.bottom.color = colorCfg.primary;
          padding = 2;
          module.margin = 1;
          font = [ "FuraCode Nerd Font:style=Regular:size=10;1" ];
          enable.ipc = true;

          modules = {
            left = "battery sepr wired-network wireless-network sepr backlight sepr pulseaudio sepr";
            center = "bspwm";
            right = "sepl spotify spotify-prev spotify-play-pause spotify-next sepl date";
          };
        };
        "module/battery" = {
          type = "internal/battery";
          battery = hardwareCfg.power.battery;
          adapter = hardwareCfg.power.adapter;
          full.at = 99;

          format = {
            charging = "<animation-charging> <label-charging>";
            discharging = "<ramp-capacity> <label-discharging>";
          };
          label = {
            charging = "%percentage%%";
            discharging = "%percentage%%";
            full = " Fully charged";
          };
          ramp.capacity = [ "" "" "" "" "" ];
          animation = {
            charging = [ "" "" "" "" "" ];
            charging-framerate = 750;
          };
        };
        "module/wired-network" = {
          type = "internal/network";
          interface = "enp0s25";
          interface-type = "wired";

          label.connected = " %ifname%: Connected (%downspeed%)";
        };
        "module/wireless-network" = {
          type = "internal/network";
          interface = "wlp3s0";
          interface-type = "wireless";

          label = {
            connected = "直 %essid% (%downspeed%)";
            disconnected = "睊 %ifname%: Not connected";
            disconnected-foreground = colorCfg.bright.red;
          };
        };
        "module/backlight" = {
          type = "internal/backlight";
          card = hardwareCfg.backlight;
          enable-scroll = true;

          format = "<ramp> <bar>";
          ramp = [ "" "" "" "" ];
          bar = {
            indicator = "";
            width = 10;
            fill = "▐";
            empty = "-";
          };
        };
        "module/pulseaudio" = {
          type = "internal/pulseaudio";
          use-ui-max = false;

          format = {
            volume = "<ramp-volume> <bar-volume>";
            muted = "<ramp-volume> <bar-volume>";
          };
          ramp.volume = [ "婢" "奄" "奔" "墳" ];
          bar.volume = {
            indicator = "";
            width = 10;
            fill = "▐";
            empty = "-";
          };
        };
        "module/filesystem" = {
          type = "internal/fs";
          mount = [ "/" "/home" ];

          label = {
            mounted = " %mountpoint%: %used%/%total%";

            unmounted = " %mountpoint%: Not mounted";
            unmounted-foreground = colorCfg.bright.red;

            warn = " %mountpoint%: %used%/%total%";
            warn-foreground = colorCfg.bright.yellow;
          };
        };
        "module/cpu" = {
          type = "internal/cpu";

          label = " %percentage%%";
          label-warn = " %percentage%%";
          label-warn-foreground = colorCfg.bright.yellow;
        };
        "module/memory" = {
          type = "internal/memory";

          label = " %gb_used%/%gb_total%";
          label-warn = " %gb_used%/%gb_total%";
          label-warn-foreground = colorCfg.bright.yellow;
        };
        "module/bspwm" = {
          type = "internal/bspwm";

          ws-icon = [ "1;" "2;" "3;" "4;" "5;" "0;" "9;" ];
          label = {
            focused = " ";
            occupied = " ";
            urgent = " ";
            urgent-foreground = colorCfg.bright.red;
            empty = "%icon% ";
          };
        };
        "module/spotify" = {
          type = "custom/script";
          tail = true;
          interval = 1;
          # format-prefix = "<prefix-symbol>";
          format = "<label>";
          exec = "${scrollSpotify}/bin/scroll_spotify_status.sh";
        };
        "module/spotify-prev" = {
          type = "custom/script";
          exec = "echo 玲";
          format = "<label>";
          click-left = "playerctl previous -p spotifyd";
        };
        "module/spotify-play-pause" = {
          type = "custom/ipc";
          hook-0 = "echo ";
          hook-1 = "echo ";
          initial = 1;
          click-left = "playerctl play-pause -p spotifyd";
        };
        "module/spotify-next" = {
          type = "custom/script";
          exec = "echo 怜";
          format = "<label>";
          click-left = "playerctl next -p spotifyd";
        };
        "module/date" = {
          type = "internal/date";

          date = "%Y-%m-%d%";
          time = "%H:%M";
          date-alt = "%A, %d %B %Y";
          time-alt = "%H:%M:%S";

          label = " %date%  %time%";
        };
        "module/sepr" = {
          type = "custom/text";

          content = "";
          content-foreground = colorCfg.primary;
        };
        "module/sepl" = {
          type = "custom/text";

          content = "";
          content-foreground = colorCfg.primary;
        };
      };
    };
  };
}
