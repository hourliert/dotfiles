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
    opts = function(_, opts)
      local exclude = {
        "**/.git",
        "**/node_modules",
        "**/dist",
        "**/out",
        "**/release",
        "**/.husky",
        "**/.turbo",
        "**/tmp",
        "**/.pnpm-store",
        "**/coverage",
      }
      local source = { hidden = true, ignored = true, exclude = exclude }
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          sources = {
            files = source,
            grep = source,
            explorer = source,
          },
        },
      })
    end,
  },
}
