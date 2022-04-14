{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    programs.lf = {
      enable = true;
    };
  };
}

