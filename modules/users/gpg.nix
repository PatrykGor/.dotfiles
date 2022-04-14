{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    programs.gpg = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      pinentryFlavor = "gtk2";
    };
  };
}

