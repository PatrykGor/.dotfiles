{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    home.keyboard.options = [
      "caps:swapescape"
      "altwin:swap_lalt_lwin"
    ];

    #Additional packages
    home.packages = with pkgs; [
      pinentry-gtk2
      gnupg
      ueberzug
      xdotool
      xorg.xbacklight
      wget
      rofi
      git
      git-crypt
      zip
      mpv
      unzip
      killall
      alacritty
      firefox-bin
      exa
      bat
      neofetch
      zathura
      pulsemixer
      maim
      imagemagick
      xclip
      zscroll
      sxiv
      sad
      trash-cli
      rmtrash
      jq
      fzy
      fuse
      wmctrl
      ffmpeg
      mtpfs
      playerctl

      # Fonts
      (nerdfonts.override { fonts = [ "FiraCode" "DejaVuSansMono" ]; })
    ];

    # Make fonts work
    fonts.fontconfig.enable = true;

    # Wallpaper
    services.random-background = {
      enable = true;
      imageDirectory = "%h/Pictures/wallpapers/current";
    };
  };
}
