{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      inherit (nixpkgs) lib;

      util = import ./lib {
        inherit system pkgs home-manager lib; overlays = (pkgs.overlays);
      };

      inherit (util) user;
      inherit (util) host;

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ ];
      };

      system = "x86_64-linux";
    in
    {
      homeManagerConfigurations = {
        patryk = user.mkHMUser {
          userConfig = {
            # Abstracted user config
            # Import encrypted secrets
            credentials = import ./secrets.nix;
            remote = {
              gorscy = {
                user = "root";
                address = "gorscy.net";
                publicKey = ''
                  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBTDrjarlfjwtS+61GnQ+qzFC6YjFK04eQL0whuyQJUgfekH7znONfieqcHlLbWDJ74KASHiVg//zbI3/nf9lQYvuJ41kG1LTuSjTkuwjnnBcTyeVM/5hEzq3NsYNVjsMA5jMMaKw50FJVhee250CmIqW0df34aGp21aAKk7OAOh+HOr700qx/c4V0q5DPjh4MNr4QqXiR+S01c8uHqCQuXJ2C47+y5FUk2vBOekenza6y0b0jveOzw/gymVF7pXDdb5lpY0s/YWcgtsFSTca5Eda2uINGZNth7v0wlvZcc9pLkkNUqdDQY8ZSVX5/iTO3A0MjMumKDQzpxK/+dEnH
                '';
              };
            };
            monitors = {
              external = {
                name = "DP-2";
                resolution = {
                  width = 2560;
                  height = 1440;
                };
                refreshRate = 144;
              };
              native = {
                name = "LVDS-1";
                resolution = {
                  width = 1366;
                  height = 768;
                };
                refreshRate = 60;
              };
            };
            bar = {
              height = 25;
              border = 4;
            };
            email = {
              personal = "patryk@gorscy.net";
              work = "patryk.gorski@takes-care.com";
            };
            git = {
              username = "PatrykGor";
            };
            colors = {
              bg = "#2e3440";
              fg = "#d8dee9";
              primary = "#3b4252";

              normal = {
                black = "#3b4252";
                red = "#bf616a";
                green = "#a3be8c";
                yellow = "#ebcb8b";
                blue = "#81a1c1";
                magenta = "#b48ead";
                cyan = "#88c0d0";
                white = "#e5e9f0";
              };

              bright = {
                black = "#4c566a";
                red = "#bf616a";
                green = "#a3be8c";
                yellow = "#ebcb8b";
                blue = "#81a1c1";
                magenta = "#b48ead";
                cyan = "#8fbcbb";
                white = "#eceff4";
              };
            };
          };
        };
      };

      nixosConfigurations = {
        laptop = host.mkHost {
          name = "laptop";
          NICs = [ "enp0s25" "wlp3s0" ];
          kernelPackage = pkgs.linuxPackages;
          initrdMods = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "sdhci_pci" ];
          kernelMods = [ "kvm-intel" ];
          kernelParams = [ ];
          systemConfig = {
            # Abstracted system config
            hardware = {
              drive = {
                uuid = "63bf4d42-36f2-440a-a851-d0437afb0ebd";
              };
              power = {
                battery = "BAT0";
                adapter = "AC";
              };
              backlight = "intel_backlight";
            };
          };
          fileSystems = {
            "/" =
              {
                device = "/dev/disk/by-uuid/d2536da0-41ce-43d9-9165-35dadbcbaa56";
                fsType = "ext4";
              };

            "/home" =
              {
                device = "/dev/disk/by-uuid/e15299e2-62c2-43c3-b89e-975434643dc1";
                fsType = "ext4";
              };

            "/boot" =
              {
                device = "/dev/disk/by-uuid/03BA-093F";
                fsType = "vfat";
              };
          };
          users = [{
            name = "patryk";
            groups = [ "wheel" "networkmanager" "video" ];
            uid = 1000;
            shell = pkgs.zsh;
          }];
          cpuCores = 2;
        };
      };
    };
}
