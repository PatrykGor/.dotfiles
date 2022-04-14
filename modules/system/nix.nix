{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    nix = {
      package = pkgs.nixFlakes; # or versioned attributes like nix_2_7
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
      autoOptimiseStore = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}

