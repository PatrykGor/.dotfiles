{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    services.keybase = {
      enable = true;
    };

    services.kbfs = {
      enable = true;
      mountPoint = "Keybase";
    };
  };
}

