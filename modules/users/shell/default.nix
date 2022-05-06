{ config, lib, pkgs, ... }:
with lib;

{
  config = {
    home.sessionPath = [ "$HOME/.local/bin" ];
    home.file.scripts = {
      recursive = true;
      source = ./scripts;
      target = ".local/bin";
    };
    home.sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "qutebrowser";
      TERMINAL = "alacritty";
    };
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      enableVteIntegration = true;
      autocd = true;
      defaultKeymap = "viins";
      shellAliases = {
        yay = "upflake";
        md = "mkdir -p";
        reload = "sudo systemctl restart display-manager.service";
        ls = "exa --icons -a --group-directories-first";
        cat = "bat";
        pinit = "touch .root && lorri init && direnv allow && nvim ./shell.nix";
        rm = "rmtrash";
        rmd = "rmdirtrash";
        sed = "sad";
        ssh = "TERM=rxvt-256color ssh";
        vimdiff = "nvim -d";
      };
      dirHashes = {
        docs = "$HOME/Documents";
        work = "$HOME/Projects/work";
        school = "$HOME/Projects/school";
        dl = "$HOME/Downloads";
        conf = "$HOME/.dotfiles";
      };
      history.path = "${config.xdg.dataHome}/history";
      dotDir = ".config/zsh";
      initExtra = ''
        source ${./shconfig.sh}
      '';
    };
    programs.starship = {
      enable = true;
      settings = {
        format = lib.concatStrings [
          "$time"
          "$username$hostname"
          "$git_branch"
          "$git_status"
          "$status"
          "$character"
        ];
        hostname = {
          format = "[@$hostname]($style)";
        };
        time = {
          disabled = false;
        };
      };
    };
  };
}
