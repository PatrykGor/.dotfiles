{ config, pkgs, lib, ... }:

{
  imports = [
    ./core.nix
    ./networkmount.nix
    ./nix.nix
    ./bootloader.nix
    ./locale.nix
    ./xorg.nix
    ./sudo.nix
    ./sound.nix
    ./shell.nix
    ./graphics.nix
  ];
}
