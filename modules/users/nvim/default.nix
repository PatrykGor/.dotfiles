{ config, pkgs, lib, vimUtils, ... }:
with lib;

{
  config = {
    programs.neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;

      # read in the vim config from filesystem
      # this enables syntaxhighlighting when editing those
      extraConfig = ''
        source ${./vim/base.vim}
        source ${./vim/plugins.vim}
        source ${./vim/lsp.vim}

        " ------ TEMPLATES ------{{{
        augroup templates
            " html
            autocmd BufNewFile *.html 0r ${./vim/templates/skeleton.html}
            autocmd BufNewFile *.htm 0r ${./vim/templates/skeleton.html}
            " nix
            autocmd BufNewFile *.nix 0r ${./vim/templates/skeleton.nix}
        augroup END
        "}}}
      '';

      # install needed binaries here
      extraPackages = with pkgs; [
        # installs different langauge servers for neovim-lsp
        # have a look on the link below to figure out the ones for your languages
        # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
        rnix-lsp

        #telescope
        fd
        ripgrep

        #gutentags
        universal-ctags

        #sqlite.lua
        sqlite

        #treesitter compiler:
        gcc

        # vimwiki markdown converter:
        vimwiki-markdown
      ];

      coc = {
        enable = true;
        settings = {
          languageserver = {
            nix = {
              command = "rnix-lsp";
              filetypes = [
                "nix"
              ];
            };
          };
        };
      };

      plugins = with pkgs.vimPlugins; [
        #theme:
        nord-nvim

        #other visuals:
        nvim-web-devicons
        lualine-nvim
        indent-blankline-nvim
        vim-which-key

        #git integration:
        vim-gitgutter
        vim-fugitive

        #vimwiki:
        vimwiki

        #files:
        lf-vim
        vim-floaterm

        #school:
        coc-nvim
        coc-pyright
        coc-clangd

        #work:
        coc-java
        coc-tsserver
        coc-html
        coc-emmet
        coc-css
        coc-json

        #rest:
        coc-vimlsp

        #snippets
        coc-snippets
        vim-snippets

        #syntax highlighting
        nvim-treesitter

        #direnv
        direnv-vim

        # auto bracket
        pear-tree

        #project management
        vim-rooter

        #telescope
        plenary-nvim
        telescope-nvim
        telescope-fzy-native-nvim
        sqlite-lua
        telescope-cheat-nvim

        #coding tools
        vim-gutentags

        #utility
        targets-vim
        vim-repeat
        vim-surround
        vim-commentary
        lightspeed-nvim
      ];
    };
  };
}