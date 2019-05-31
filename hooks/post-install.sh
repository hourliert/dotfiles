#!/bin/sh

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim-plug installed"

echo "Installing vim plugins"
vim +PlugInstall +PlugClean +qa
echo "vim plugins installed"

echo "Installing ZPLUG"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo "ZPLUG installed"

echo "Install ZSH plugins"
zplug install
echo "ZSH plugins installed"

echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "TPM installed"

echo "Please go to tmux and run CTRL+A + I to install plugins"
