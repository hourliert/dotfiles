dotfiles
===

Installation
---

* `brew tap thoughtbot/formulae`
* `brew install rcm`

* Install iTerm2 and import settings: https://www.iterm2.com/
* Install oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh#basic-installation
* Install fonts: https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager
* Install neovim and dependencies: `brew install neovim node yarn zplug python pyenv pyenv-virtualenv rbenv ctags fzf tmux`
* Install nvm: https://github.com/creationix/nvm#install-script
* Install TPM: https://github.com/tmux-plugins/tpm#installation
* Install Vim-Plug: https://github.com/junegunn/vim-plug#installation

Sync dotfiles
---

After cloning or making changes to dotfiles:

```bash
rcup -v
```

To preview what will be linked (dry run):

```bash
lsrc
```

**Note:** `rcup` creates new symlinks but won't remove stale ones. If you delete a file from `.dotfiles`, manually remove the broken symlink from `~`.

Add more dotfiles
---

```bash
mkrc ~/.new_dot_file
```

Neovim Jupyter Notebook Support
---

The neovim config includes `molten-nvim` and `jupytext.nvim` for Jupyter notebook editing. This requires additional setup:

### 1. Create a dedicated Python venv for Neovim

```bash
python3 -m venv ~/.nvim-venv
~/.nvim-venv/bin/pip install pynvim jupyter_client
```

### 2. Install jupytext CLI globally

```bash
uv tool install jupytext
```

### 3. Register remote plugins (run once in Neovim)

```
:UpdateRemotePlugins
```

Then restart Neovim.

### 4. Register project kernels (per-project)

For each project with Jupyter notebooks, register the kernel with `--user` so Neovim can find it:

```bash
cd ~/src/your-project
.venv/bin/python -m ipykernel install --user --name your-project
```

### Usage

1. Open a `.ipynb` file (jupytext converts it to plain text automatically)
2. Run `:MoltenInit` and select your kernel
3. Use `:MoltenEvaluateLine` or select code and `:MoltenEvaluateVisual` to execute
