return {
  {
    -- Seamless movement between Neovim splits and tmux panes:
    --   <C-h>/<C-j>/<C-k>/<C-l> move across splits AND tmux panes.
    "christoomey/vim-tmux-navigator",
    lazy = false, -- load immediately so navigation always works
    config = function()
      -- If a tmux pane is zoomed, don't move out of it
      vim.g.tmux_navigator_disable_when_zoomed = 1
      -- Defaults already map <C-h/j/k/l>, so we don't need to add keymaps here.
    end,
  },
  {
    -- Disable K (LSP Hover) keymap so we can use it for scrolling
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
          },
        },
      },
    },
  },
  {
    -- Configure snacks.nvim: always search hidden files with C-p and C-r
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
        },
      },
      explorer = {
        hidden = true,
        ignored = true,
      },
    },
  },

  {
    -- theme
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
      },
    },
  },
  {
    -- Set catppuccin as the active colorscheme
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
