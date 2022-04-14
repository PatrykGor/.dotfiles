{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    #Shell configuration
    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];
  };
}

