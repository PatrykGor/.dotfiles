{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.patryk.remote;
in
{
  options.patryk.remote = {
    gorscy = mkOption {
      description = "Data for gorscy.net domain";
      type = types.attrs;
    };
  };
  config = {
    # Mount network devices
    programs.fuse.userAllowOther = true;
    programs.ssh.knownHosts = {
      gorscy = {
        hostNames = [ cfg.gorscy.address ];
        publicKey = cfg.gorscy.publicKey;
      };
    };
    services.autofs = {
      enable = true;
      debug = true;
      autoMaster =
        let
          mapConf = pkgs.writeText "auto.ssh" ''
            gorscy -fstype=fuse,rw,allow_other,IdentityFile=/home/patryk/.ssh/id_rsa :${pkgs.sshfs}/bin/sshfs\#${cfg.gorscy.user}@${cfg.gorscy.address}\:/
          '';
        in
        ''
          /mnt ${mapConf} --timeout=60
        '';
    };
  };
}

