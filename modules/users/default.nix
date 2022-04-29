{ config, pkgs, lib, ... }:

{
  imports = [
    ./core.nix
    ./gpg.nix
    ./xdg.nix
    ./git.nix
    ./mail.nix
    ./shell
    ./sxhkd.nix
    ./bspwm.nix
    ./qutebrowser.nix
    ./nvim
    ./direnv.nix
    ./polybar
    ./rofi
    ./spotify.nix
    ./picom.nix
    ./alacritty.nix
    ./rbw.nix
    ./keybase.nix
    ./lf.nix
    /* ./eww */
  ];
}

