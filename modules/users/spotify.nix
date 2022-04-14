{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    programs.ncspot = {
      enable = true;
      settings = {
        backend = "pulseaudio";

        flip_status_indicators = true;
        use_nerdfont = true;
        notify = true;
        shuffle = true;
        repeat = "playlist";

        keybindings = {
          "y" = "share selected";
          "Shift+y" = "share current";

          "Space" = "playpause";

          "q" = "queue; move down";

          "<" = "seek -1000";
          ">" = "seek +1000";
          "]" = "next";
          "[" = "previous";
        };
        /* theme = { */
        /* }; */
      };
    };
  };
}

