{ ... }: {
  imports = [
    ./lsp
    ./misc
    ./telescope
    ./which-key
    ./ui
  ];
  config = {
    colorschemes.catppuccin = {
      enable = true;
      terminalColors = true;
      disableItalic = false;
      disableBold = false;
    };
    luaLoader.enable = true;
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = [
          "v"
          "go"
          "rust"
          "nix"
          "lua"
          "bash"
          "haskell"
          "html"
          "astro"
          "norg"
          "norg_meta"
        ];
        folding = true;
        indent = true;
        nixGrammars = true;
        nixvimInjections = true;
      };
      project-nvim.enable = true;
    };
    globals.mapleader = " "; # Sets the leader key to space
    options = {
      wrap = true;
      cmdheight = 0;
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      guifont = "Iosevka Nerd Font Mono:h8";
      clipboard = "unnamedplus";
      timeout = true;
      timeoutlen = 300;
      smarttab = false;
      foldenable = false;
      tabstop = 2;
      shiftwidth = 2;
      autoindent = true;
      cindent = true;
      smartindent = true;
      smartcase = true;
      ignorecase = true;
      infercase = true;
      showmode = false;
      ruler = false;
      showcmd = true;
      breakindent = true;
      copyindent = true;
      cursorline = true;
      expandtab = true;
      preserveindent = true;
      pumheight = 0;
      undofile = true;
      virtualedit = "block";
    };
    globals = {
      # neovide_padding_top = 50;
      # neovide_padding_bottom = 50;
      # neovide_padding_right = 50;
      # neovide_padding_left = 50;
    };
  };
}
