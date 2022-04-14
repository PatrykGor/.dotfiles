{ config, pkgs, lib, ... }:
with lib;

let
  mailCfg = config.patryk.email;
  cfg = config.patryk.git;
in
{
  options.patryk.git = {
    username = mkOption {
      description = "Username for commits";
      type = types.str;
    };
  };
  config = {
    programs.git = {
      enable = true;
      aliases = {
        ga = "add";
        gc = "commit -m";
        gp = "push origin";
      };

      delta.enable = true;

      userEmail = mailCfg.personal;
      userName = cfg.username;
    };
  };
}

