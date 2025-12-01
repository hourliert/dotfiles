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

-- Ctrl-C: escape + close quickfix/location list + clear search highlight
map({ "i", "v", "c" }, "<C-c>", "<Esc>", { desc = "Ctrl-C as Escape" })
map("n", "<C-c>", "<cmd>cclose<CR><cmd>lclose<CR><cmd>nohlsearch<CR>", { silent = true, desc = "Close windows & clear highlight" })

-- Fuzzy find files (like old Ctrl+P with FZF)
map("n", "<C-p>", "<leader><Space>", { remap = true, desc = "Fuzzy find files" })

-- Global text search (like old Ctrl+R with CtrlSF) - uses LazyVim's grep
map("n", "<C-r>", "<leader>sg", { remap = true, desc = "Global grep search" })
map("x", "<C-r>", "<leader>sg", { remap = true, desc = "Global grep search" })

-- Remap redo to U (since C-r is now global search)
map("n", "U", "<C-r>", { noremap = true, desc = "Redo" })

map("x", "p", "pgvy", { noremap = true, silent = true })

-- Scroll up/down while keeping cursor in position
map("n", "J", "<C-e>", { noremap = true, silent = true, desc = "Scroll down" })

map("n", "K", "<C-y>", { noremap = true, silent = true, desc = "Scroll up" })

-- Remap LSP Hover to gh (since K is now scroll)
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP Hover" })
