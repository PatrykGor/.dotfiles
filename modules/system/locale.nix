{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    # Set your time zone.
    time.timeZone = "Europe/Warsaw";

    # Select internationalisation properties.
    i18n = {
      defaultLocale = "pl_PL.UTF-8";
      extraLocaleSettings = {
        LC_MESSAGES = "en_US.UTF-8";
      };
    };
  };
}

