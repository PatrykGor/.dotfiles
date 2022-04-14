{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };
    services.lorri.enable = true;
  };
}

