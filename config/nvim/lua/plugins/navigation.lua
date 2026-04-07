return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end,
  },
  {
    "tpope/vim-projectionist",
    lazy = false,
    config = function()
      vim.g.projectionist_heuristics = {
        ["spec/*"] = {
          ["app/*.rb"] = { alternate = "spec/{}_spec.rb" },
          ["lib/*.rb"] = { alternate = "spec/{}_spec.rb" },
          ["spec/*_spec.rb"] = { alternate = "app/{}.rb" },
        },
      }
    end,
  },
  {
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
}
