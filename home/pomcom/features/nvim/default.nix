{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  ##  TODO: Autobrackets, Snippets
  ##  FIXME: Autobrackets, Snippets
  ##  HACK: Autobrackets, Snippets

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.ayu.enable = true;

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = {
          silent = true;
          desc = "Find files in project";
        };
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope grep_string<cr>";
        options = {
          silent = true;
          desc = "Grep files in project";
        };
      }
      {
        key = "<leader>ft";
        action = "<cmd>TodoTelescope<cr>";
        options = {
          silent = true;
          desc = "Search TODO comments";
        };
      }
    ];

    plugins = {
      lsp = {
        enable = true;

        servers = {
          clangd.enable = true;
          dockerls.enable = true;
          gopls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          pyright.enable = true;
          terraformls.enable = true;
          texlab.enable = true;
          typst-lsp.enable = true;
          yamlls.enable = true;
          rnix-lsp.enable = true;
          tsserver.enable = true;
        };

        keymaps = {
          diagnostic = {
            "]d" = "goto_next";
            "[d" = "goto_prev";
          };
        };
      };

      lsp-format.enable = true;

      lspkind.enable = true;

      lint.enable = true;

      treesitter.enable = true;

      telescope.enable = true;

      lualine.enable = true;

      vim-matchup.enable = true;

      barbar.enable = true;

      comment.enable = true;

      todo-comments.enable = true;

      gitsigns.enable = true;

      indent-blankline.enable = true;

      fidget.enable = true;

      surround.enable = true;

      illuminate.enable = true;

      trouble.enable = true;

      neo-tree.enable = true;

      which-key.enable = true;


      # obsidian = {
      #   enable = true;
      #   workspaces = [
      #     {
      #       name = "k-base";
      #       path = "/home/pomcom/k-base";
      #     }
      #   ];
      # };
      #
      # cmp = {
      #   enable = true;
      #   autoEnableSources = true;
      #   sources = [
      #     { name = "nvim_lsp"; }
      #     { name = "path"; }
      #     { name = "buffer"; }
      #   ];
      #
      #   mapping.preset.insert = {
      #     "<C-Space>" = "cmp.mapping.complete()";
      #     "<C-d>" = "cmp.mapping.scroll_docs(-4)";
      #     "<C-e>" = "cmp.mapping.close()";
      #     "<C-f>" = "cmp.mapping.scroll_docs(4)";
      #     "<CR>" = "cmp.mapping.confirm({ select = true })";
      #     "<C-p>" = {
      #       action = "cmp.mapping.select_prev_item()";
      #       modes = [ "i" "s" ];
      #     };
      #     "<C-n>" = {
      #       action = "cmp.mapping.select_next_item()";
      #       modes = [ "i" "s" ];
      #     };
      #   };
      # };
    };

    extraPlugins = with pkgs.vimPlugins; [
    ];
  };
}
