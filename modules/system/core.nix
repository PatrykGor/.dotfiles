{ config, pkgs, lib, ... }:
with lib;

let
  hardwareCfg = config.patryk.hardware;
in
{
  options.patryk.hardware = {
    drive = mkOption {
      description = "System drive data";
      type = types.attrs;
    };
    backlight = mkOption {
      description = "Name of backlight device";
      type = types.str;
    };

    power = mkOption {
      description = "Data about the battery and it's charger";
      type = types.attrs;
    };
  };

  config = {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      mesa.drivers
      git
      fuse
      sshfs
    ];

    # Install user packages to /etc/profiles
    /* home-manager.useUserPackages = true; */

    boot.initrd.luks.devices.lvmroot.device = "/dev/disk/by-uuid/${hardwareCfg.drive.uuid}";
    swapDevices = [{ device = "/swapfile"; size = 10000; }];

    # Rules to enable backlight control for regular users
    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="${hardwareCfg.backlight}", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
  };
}

