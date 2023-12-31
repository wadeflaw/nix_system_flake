{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = false;
    package = pkgs.neovim-unwrapped;

    options = {
      number = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      laststatus = 3;
      termguicolors = true;
    };

    colorschemes = {
    	catppuccin = {
	  enable = true;
	};
    };

    globals = {
      mapleader = " ";
    };

    maps = {
      normal = {
        # switch between buffers
        "<TAB>" = {
          action = ":bnext<CR>";
          noremap = true;
          silent = true;
        };
        "<S-TAB>" = {
          action = ":bprev<CR>";
          noremap = true;
          silent = true;
        };
        "<C-N>" = {
          action = ":NvimTreeToggle<CR>";
          noremap = true;
          silent = true;
        };
        "<C-b>" = {
          action = ":NvimTreeFocus<CR>";
          noremap = true;
          silent = true;
        };
        "tt" = {
          action = ":ToggleTerm direction=float<CR>";
          noremap = true;
          silent = true;
        };
        "<leader><space>" = {
          action = ":Telescope<CR>";
          noremap = true;
          silent = true;
        };
        "ff" = {
          action = ":Telescope find_files<CR>";
          noremap = true;
          silent = true;
        };
      };
    };

    plugins = {
      notify = {
        enable = true;
      };
      noice = {
        enable = true;
      };
      bufferline = {
        enable = true;
      };
      comment-nvim = {
        enable = true;
      };
      nvim-autopairs = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      nix = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          pyright.enable = true;
        };
      };
      lspkind = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
        sources = [{ name = "nvim_lsp"; }];
        formatting.fields = [ "kind" "abbr" "menu" ];
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-base16
    ];

    extraConfigLua = ''
      fn = vim.fn
      api = vim.api
      cmd = vim.cmd
      opt = vim.opt
      g = vim.g

      _G.theme = "catppuccin"

      require('base16-colorscheme').setup({
        base00 = '#1d2021',
        base01 = '#3c3836',
        base02 = '#504945',
        base03 = '#665c54',
        base04 = '#bdae93',
        base05 = '#d5c4a1',
        base06 = '#ebdbb2',
        base07 = '#fbf1c7',
        base08 = '#fb4934',
        base09 = '#fe8019',
        base0A = '#fabd2f', 
        base0B = '#b8bb26',
        base0C = '#8ec07c',
        base0D = '#83a598',
        base0E = '#d3869b',
        base0F = '#d65d0e'
      })

      local present, base16 = pcall(require, "base16-colorscheme")
      if not present then return end

      local present, color = pcall(require, "colors." .. theme)
      if present then
        base16.setup(color)
      else
        local ok, err = pcall(cmd, ("colorscheme base16-" .. theme))
        if not ok then
          _G.theme = "catppuccin"
          color = require("colors." .. _G.theme)
          base16.setup(color)
          print(err)
        end
      end

      -- Highlights 
      local function hl(highlight, fg, bg)
        if fg == nil then fg = "none" end
        if bg == nil then bg = "none" end
        cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
      end

      -- Status Line
      hl("StatusNormal")
      hl("StatusLineNC", color.base03)
      hl("StatusActive", color.base05)
      hl("StatusLine", color.base02) -- inactive
      hl("StatusReplace", color.base08)
      hl("StatusInsert", color.base0B)
      hl("StatusCommand", color.base0A)
      hl("StatusVisual", color.base0D)
      hl("StatusTerminal", color.base0E)

      -- Nvim Tree
      hl("NvimTreeFolderName", color.base05)
      hl("NvimTreeOpenedFolderName", color.base05)
      hl("NvimTreeEmptyFolderName", color.base05)
      hl("NvimTreeFolderIcon", color.base03)
      hl("NvimTreeGitDirty", color.base08)
      hl("NvimTreeGitNew", color.base0B)
      hl("NvimTreeGitDeleted", color.base08)
      hl("NvimTreeGitRenamed", color.base0A)
      hl("NvimTreeGitExecFile", color.base0B)
      hl("NvimTreeSpecialFile", color.base0E)
      hl("NvimTreeImageFile", color.base0C)
      hl("NvimTreeWindowPicker", color.base05, color.base01)
      hl("NvimTreeIndentMarker", color.base03)

      -- Telescope
      hl("TelescopePromptBorder", color.base01, color.base01)
      hl("TelescopePromptNormal", nil, color.base01)
      hl("TelescopePromptPrefix", color.base08, color.base01)
      hl("TelescopeSelection", nil, color.base01)


      -- Menu
      hl("Pmenu", nil, color.base01)
      hl("PmenuSbar", nil, color.base01)
      hl("PmenuThumb", nil, color.base01)
      hl("PmenuSel", nil, color.base02)

      -- CMP
      hl("CmpItemAbbrMatch", color.base05)
      hl("CmpItemAbbrMatchFuzzy", color.base05)
      hl("CmpItemAbbr", color.base03)
      hl("CmpItemKind", color.base0E)
      hl("CmpItemMenu", color.base0E)
      hl("CmpItemKindSnippet", color.base0E)

      -- Number
      hl("CursorLine")
      hl("CursorLineNR")
      hl("LineNr", color.base03)

      -- Others
      hl("VertSplit", color.base01, nil)
      hl("NormalFloat", nil, color.base01)
      hl("FloatBorder", color.base01, color.base01)

      -- Extra
      cmd("hi StatusLine gui=strikethrough")

      local modes = {
        ['n']    = 'NORMAL',
        ['no']   = 'NORMAL',
        ['nov']  = 'NORMAL',
        ['noV']  = 'NORMAL',
        ['no'] = 'NORMAL',
        ['niI']  = 'NORMAL',
        ['niR']  = 'NORMAL',
        ['niV']  = 'NORMAL',

        ['i']   = 'INSERT',
        ['ic']  = 'INSERT',
        ['ix']  = 'INSERT',
        ['s']   = 'INSERT',
        ['S']   = 'INSERT',

        ['v']   = 'VISUAL',
        ['V']   = 'VISUAL',
        ['']  = 'VISUAL',
        ['r']   = 'VISUAL',
        ['r?']  = 'VISUAL',

        ['c']   = 'TERMINAl',
        ['t']   = 'TERMINAL',
        ['!']   = 'TERMINAL',
        ['R']   = 'TERMINAL',
      }

      local icons = {
        ['typescript']         = ' ',
        ['python']             = ' ',
        ['java']               = ' ',
        ['html']               = ' ',
        ['css']                = ' ',
        ['scss']               = ' ',
        ['javascript']         = ' ',
        ['javascriptreact']    = ' ',
        ['markdown']           = ' ',
        ['sh']                 = ' ',
        ['zsh']                = ' ',
        ['vim']                = ' ',
        ['rust']               = ' ',
        ['cpp']                = ' ',
        ['c']                  = ' ',
        ['go']                 = ' ',
        ['lua']                = ' ',
        ['conf']               = ' ',
        ['haskel']             = ' ',
        ['ruby']               = ' ',
        ['txt']                = ' ',
        ['nix']                = ' '
      }

      local function color()
        local mode = api.nvim_get_mode().mode
        local mode_color = "%#StatusLine#"
        if mode == "n" then
          mode_color = "%#StatusNormal#"
        elseif mode == "i" or mode == "ic" then
          mode_color = "%#StatusInsert#"
        elseif mode == "v" or mode == "V" or mode == "" then
          mode_color = "%#StatusVisual#"
        elseif mode == "R" then
          mode_color = "%#StatusReplace#"
        elseif mode == "c" then
          mode_color = "%#StatusCommand#"
        elseif mode == "t" then
          mode_color = "%#StatusTerminal#"
        end
        return mode_color
      end

      local function branch()
        local cmd = io.popen('git branch --show-current 2>/dev/null')
        local branch = cmd:read("*l") or cmd:read("*a")
        cmd:close()
        if branch ~= "" then
          return string.format("   " .. branch)
        else
          return ""
        end
      end

      -- StatusLine Modes
      Status = function()
        return table.concat {
          color(), -- mode colors
          string.format("  %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
          "%#StatusActive#", -- middle color
          branch(),
          -- " %f ", -- file name
          "%=", -- right align
          string.format("%s", (icons[vim.bo.filetype] or "")),
          " %f ",
          color(), -- mode colors
          " %l:%c  ", -- line, column
        }
      end

      -- Execute statusline
      api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
        pattern = "*",
        command = "setlocal statusline=%!v:lua.Status()",
      })
      api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
        pattern = "*",
        command = "setlocal statusline=%#StatusLine#",
      })
      api.nvim_create_autocmd({"WinLeave", "BufLeave", "WinEnter", "BufEnter", "FileType"}, {
        pattern = {"NvimTree*", "terminal"},
        command = "setlocal statusline=%#StatusNormal#",
      })
    '';
  };
}
