{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    #Allow wheel group to run sudo without password prompt.
    security.sudo.extraRules = [
      {
        groups = [ "wheel" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" "SETENV" ];
          }
        ];
      }
    ];
  };
}

