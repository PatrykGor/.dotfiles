{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.patryk.email;
in
{
  options.patryk.email = {
    personal = mkOption {
      description = "Private mailbox address";
      type = types.str;
    };
    work = mkOption {
      description = "Work mailbox address";
      type = types.str;
    };
  };
  config = {
  accounts.email.accounts = {
    private = {
      address = cfg.personal;
      primary = true;
    };
    work = {
      address = cfg.work;
    };
  };
  };
}
