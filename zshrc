# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/thomashourlier/.zsh/completions:"* ]]; then export FPATH="/Users/thomashourlier/.zsh/completions:$FPATH"; fi
# ZSH
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color

# plugins
export ZPLUG_HOME=/opt/homebrew/opt/zplug
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

eval "$(/opt/homebrew/bin/brew shellenv)"

# alias
alias vim="nvim"
alias vi="vim"
alias mux="tmuxinator"
alias msm="mux start monitor"
alias re="reset"

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ruby
eval "$(rbenv init -)"

# python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

. "$HOME/.local/bin/env"

alias claude="/Users/thomashourlier/.claude/local/claude"
. "/Users/thomashourlier/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit