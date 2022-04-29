{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.patryk.bar;
in
{
  config = {
    programs.eww = {
      enable = true;
      configDir = ./eww;
    };
  };
}
