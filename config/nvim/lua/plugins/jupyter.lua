return {
  {
    -- Convert .ipynb files to editable plain text format
    "GCBallesteros/jupytext.nvim",
    config = true,
    lazy = false, -- must load immediately to handle .ipynb files
  },
  {
    -- Interactive code execution with Jupyter kernels
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    lazy = false,
    keys = {
      { "<localleader>mi", "<cmd>MoltenInit<cr>", desc = "Initialize Molten" },
      { "<localleader>mx", "<cmd>MoltenInterrupt<cr>", desc = "Interrupt kernel" },
      { "<localleader>ms", "<cmd>MoltenRestart!<cr>", desc = "Restart kernel" },
    },
  },
  {
    -- Cell navigation and execution (understands # %% markers)
    "GCBallesteros/NotebookNavigator.nvim",
    dependencies = {
      "nvim-mini/mini.comment",
      "benlubas/molten-nvim",
    },
    opts = {
      repl_provider = "molten",
    },
    keys = {
      { "<localleader><cr>", function() require("notebook-navigator").run_and_move() end, desc = "Run cell & move" },
      { "<localleader>c", function() require("notebook-navigator").run_cell() end, desc = "Run cell" },
      { "]c", function() require("notebook-navigator").move_cell("d") end, desc = "Next cell" },
      { "[c", function() require("notebook-navigator").move_cell("u") end, desc = "Previous cell" },
    },
  },
}
