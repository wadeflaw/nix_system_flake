{ ... }: {
  imports = [ ./null-ls.nix ./nvim-cmp.nix ];
  config = {
    plugins = {
      # Native LSP
      lsp = {
        enable = true;
        servers = {
          gopls.enable = true;
          nil_ls.enable = true;
          nixd = {
            enable = true;
            # cmd = "";
            # extraOptions = {};
          };
          zls.enable = true;
          rust-analyzer.enable = true;
          clangd.enable = true;
          # tsserver.enable = true;
          tailwindcss.enable = true;
          cssls.enable = true;
          astro.enable = true;
        };
      };
      # LSP saga
      lspsaga = {
        enable = true;
        extraOptions = {
          ui = {
            codeAction = "";
            actionfix = "";
          };
          #   config = {
          #     "code_action" = "";
          #     "actionfix" = "";
          #   };
        };
        # icons.codeAction = "";
        # signs = {
        #   error = "";
        #   hint = "";
        #   info = "";
        #   warning = "";
        # };
      };
      emmet = {
        enable = true;
        leader = "<c-z>";
      };
    };
    # LSP Mappings
    maps = {
      # Async LSP Finder
      normal."<leader>gh" = {
        silent = true;
        action = ":Lspsaga finder<CR>";
      };
      # Code Action
      normal."<leader>la" = {
        silent = true;
        action = ":Lspsaga code_action<CR>";
      };
      #visual."<leader>la" = {
      #  silent = true;
      #  action = ":<C-U>Lspsaga range_code_action<CR>";
      #};
      # Rename
      normal."<leader>lr" = {
        silent = true;
        action = ":Lspsaga rename<CR>";
      };
      # View Definitions
      #normal."<leader>gd" = {
      #  silent = true;
      #  action = ":Lspsaga preview_definition<CR>";
      #};

      # Hover
      normal."<leader>lk" = {
        silent = true;
        action = "<cmd>Lspsaga hover_doc<cr>";
      };
      normal."K" = {
        silent = true;
        action = "<cmd>Lspsaga hover_doc<cr>";
      };
      normal."<leader>ll" = {
        silent = true;
        action = "<cmd>Lspsaga show_line_diagnostics<cr>";
        desc = "Show Line Diagnostic";
      };

      # Move Between Errors
      normal."[e" = {
        silent = true;
        action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
        desc = "Previous Error";
      };

      normal."]e" = {
        silent = true;
        action = "<cmd>Lspsaga diagnostic_jump_next<cr>";
        desc = "Next Error";
      };
    };
  };
}
