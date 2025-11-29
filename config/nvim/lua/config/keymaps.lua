-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Use <C-hjkl> to navigate via vim-tmux-navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true, desc = "Tmux/Vim left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true, desc = "Tmux/Vim down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true, desc = "Tmux/Vim up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true, desc = "Tmux/Vim right" })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { silent = true, desc = "Tmux/Vim previous split" })

map({ "n", "i", "v" }, "<C-c>", "<Esc>", { desc = "Ctrl-C as Escape" })
map({ "n", "i", "v", "c" }, "<C-c>", "<Esc>", { desc = "Ctrl-C as Escape" })

map("n", "<C-p>", "<leader><Space>", { remap = true, desc = "Fuzzy find files" })

map("x", "p", "pgvy", { noremap = true, silent = true })
