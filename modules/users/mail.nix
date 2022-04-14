{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.patryk.email;
in
{
  options.patryk.email = {
    private = mkOption {
      description = "Private mailbox address";
      type = types.str;
    };
    work = mkOption {
      description = "Work mailbox address";
      type = types.str;
    };
  };
  accounts.email.accounts = {
    private = {
      address = cfg.private;
      primary = true;
    };
    work = {
      address = cfg.work;
    };
  };
}
