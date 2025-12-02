-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

-- Python provider for molten-nvim (dedicated venv)
vim.g.python3_host_prog = vim.fn.expand("~/.nvim-venv/bin/python")
