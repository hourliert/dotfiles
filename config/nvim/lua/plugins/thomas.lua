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
}
