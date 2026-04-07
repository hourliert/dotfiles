# LazyVim Config

Based on [LazyVim](https://github.com/LazyVim/LazyVim). See [documentation](https://lazyvim.github.io/installation).

## Custom Plugins

### `lua/plugins/thomas.lua`
- vim-tmux-navigator (seamless split navigation)
- catppuccin theme
- snacks.nvim config (hidden files in search)

### `lua/plugins/jupyter.lua`
- **jupytext.nvim** - Opens `.ipynb` files as plain text
- **molten-nvim** - Execute code with Jupyter kernels

## Config

### `lua/config/options.lua`
- Leader key: `;`
- Local leader: `\`
- Python provider: `~/.nvim-venv/bin/python` (for molten-nvim)

## Jupyter Setup

See main dotfiles README for setup instructions. Key requirements:
- `~/.nvim-venv` with `pynvim` and `jupyter_client`
- `jupytext` CLI available globally (`uv tool install jupytext`)
- Run `:UpdateRemotePlugins` once after install
