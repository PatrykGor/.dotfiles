{ config, pkgs, lib, vimUtils, ... }:
with lib;

{
  config = {
    programs.neovim = {
      enable = true;
      # package = pkgs.neovim-nightly;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;

      # read in the vim config from filesystem
      # this enables syntaxhighlighting when editing those
      extraConfig = builtins.concatStringsSep "\n" [
        (strings.fileContents ./base.vim)
        (strings.fileContents ./plugins.vim)
        (strings.fileContents ./lsp.vim)

        # this allows you to add lua config files
        ''
          lua << EOF
          ${strings.fileContents ./config.lua}
          ${strings.fileContents ./lsp.lua}

          local pid = vim.fn.getpid()
          local omnisharp_bin = "${pkgs.omnisharp-roslyn}/bin/omnisharp"
          lspconfig['omnisharp'].setup{
            cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
          }
          EOF
        ''

        # additional file dependent vimscript
        ''
          " ------ TEMPLATES ------{{{
          augroup templates
              " html
              autocmd BufNewFile *.html 0r ${./templates/skeleton.html}
              autocmd BufNewFile *.htm 0r ${./templates/skeleton.html}
              " nix
              autocmd BufNewFile *.nix 0r ${./templates/skeleton.nix}
          augroup END
          "}}}
        ''

        # additional file dependent lua
        ''
          lua << EOF
          EOF
        ''
      ];

      # install needed binaries here
      extraPackages = with pkgs; [
        # installs different langauge servers for neovim-lsp
        # have a look on the link below to figure out the ones for your languages
        # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
        rnix-lsp
        clang-tools
        nodePackages.vscode-langservers-extracted
        nodePackages.diagnostic-languageserver
        nodePackages.intelephense
        nodePackages.vim-language-server
        nodePackages.typescript-language-server
        python39Packages.jedi-language-server
        sqls
        omnisharp-roslyn
        sumneko-lua-language-server
        nur.repos.mrcpkgs.eclipse-jdt-language-server

        #telescope
        fd
        ripgrep

        #gutentags
        universal-ctags

        #sqlite.lua
        sqlite

        #treesitter compiler:
        /* gcc */

        # vimwiki markdown converter:
        vimwiki-markdown
      ];

      /* coc = { */
      /*   enable = true; */
      /*   settings = { */
      /*     languageserver = { */
      /*       nix = { */
      /*         command = "rnix-lsp"; */
      /*         filetypes = [ */
      /*           "nix" */
      /*         ]; */
      /*       }; */
      /*     }; */
      /*   }; */
      /* }; */

      plugins = with pkgs.vimPlugins; [
        #theme:
        nord-nvim

        #other visuals:
        nvim-web-devicons
        lualine-nvim
        indent-blankline-nvim
        vim-which-key
        vim-hexokinase

        #git integration:
        vim-gitgutter
        vim-fugitive

        #vimwiki:
        vimwiki

        #files:
        lf-vim
        vim-floaterm

        #LSP:
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp
        cmp_luasnip
        luasnip
        nvim-jdtls

        #Github copilot
        copilot-vim

        /* #school: */
        /* coc-nvim */
        /* coc-pyright */
        /* coc-clangd */

        /* #work: */
        /* coc-java */
        /* coc-tsserver */
        /* coc-html */
        /* coc-emmet */
        /* coc-css */
        /* coc-json */

        /* #rest: */
        /* coc-vimlsp */

        /* #snippets */
        /* coc-snippets */
        /* vim-snippets */

        #syntax highlighting
        (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

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

    xdg.configFile.ftplugins = {
        source = ./ftplugin;
        target = "nvim/ftplugin";
        recursive = true;
    };
  };
}
