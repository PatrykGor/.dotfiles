{ config, pkgs, lib, ... }:
with lib;

let
  emailCfg = config.patryk.email;
in
{
  programs.rbw = {
    enable = true;
    /* package = pkgs.unstable.rbw; */

    settings = {
      email = emailCfg.personal;
    };
  };
}

