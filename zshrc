# plugins
if [ "$(uname)" = "Darwin" ]; then
    export ZPLUG_HOME="/opt/homebrew/opt/zplug"
elif [ "$(uname)" = "Linux" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export ZPLUG_HOME="/home/thomas/.zplug"
else
    echo "Unsupported OS" >&2
fi

source $ZPLUG_HOME/init.zsh
setopt prompt_subst
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3

# start zplug
zplug load

# theme settings
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  custom
  context
  dir
  ruby
  nvm
  git
  cmd_exec_time
)
BULLETTRAIN_NVM_FG=black

# alias
alias vim="nvim"
alias vi="vim"
alias v="vim"
alias mux="tmuxinator"
alias g="git"
alias msm="mux start monitor"
alias re="reset"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ruby
eval "$(rbenv init -)"
alias rake='noglob rake'

# python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

source ~/.secretrc



