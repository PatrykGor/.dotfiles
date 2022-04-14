{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    services.sxhkd = {
      enable = true;
      keybindings = {
        # Reload configuration:
        "super + shift + r" = "bspc wm -r";
        # Keybinds for basic functionality:
        "super + Return" = "alacritty";
        "super + q" = "bspc node -c";
        # Window manipulation:
        "super + {_,shift,ctrl} + {h,j,k,l}" = "bspc node -{f,s,p} {west,south,north,east}";
        "super + {t,shift+t,f,shift+f}" = "bspc node -t \\~{tiled,pseudo_tiled,fullscreen,floating}";
        "super + m" = "bspc desktop -l next";
        # Move window:
        "super + shift + {0-9}" = "bspc node -d {0-9}";
        # Change preselection ratio:
        "super + ctrl + {0-9}" = "bspc node -o 0.{0-9}";
        # Resize window:
        "super + alt + {h,j,k,l}" = "bspwm_resize {west,south,north,east}";
        # Switch to desktop:
        "super + {0-9}" = "bspc desktop -f {0-9}";
        # Open browsers:
        "super + {_,shift} + b" = "{qutebrowser,firefox}";
        # (Quick) Screenshot:
        "super + s" = "import \"Pictures/screenshots/$(date --rfc-3339=seconds).png\"";
        # Menus:
        "super + e; {r,w,m,s,u,c}" = "~/.config/rofi/{main/run,wifi/wifi,music/music,screenshot/screenshot,mount/mountusb,mount/cellmount}";
        # Hardware buttons:
        "{XF86AudioRaiseVolume,XF86AudioLowerVolume}" = "pulsemixer --change-volume {+,-}2";
        "XF86AudioMute" = "pulsemixer --mute";
        "{XF86AudioStop,XF86AudioPrev,XF86AudioNext,XF86AudioPlay}" = "playerctl {stop,previous,next,play-pause}";
      };
    };
  };
}
