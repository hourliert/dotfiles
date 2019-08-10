# plugins
export ZPLUG_HOME=$HOME/.zplug
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
alias git="hub"

# google cloud sql proxy
export PATH="$HOME/.bin:$PATH"

# google cloud sdk components
export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="$(yarn global bin):$PATH"

# ruby
eval "$(rbenv init -)"
alias rake='noglob rake'

# dart
export PATH=~/.pub-cache/bin:$PATH

# python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# go
export GOPATH="$HOME/src/go"
export PATH="$PATH:$GOPATH/bin"

# elixir
export PATH="$PATH:$HOME/.mix/escripts"

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

# dart
export PATH=~/.pub-cache/bin:$PATH

# python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# go
export GOPATH="$HOME/src/go"
export PATH="$PATH:$GOPATH/bin"

# elixir
export PATH="$PATH:$HOME/.mix/escripts"

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

# intercom
export INTERCOM_USER=thomas.hourlier
alias hammer='noglob hammer'
export AWS_DEFAULT_REGION="us-east-1"
source $(which assume-role)
export PATH=$HOME/.eshead/bin:$PATH
alias cloud="hammer workspace -u thomas.hourlier"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
source ~/.secretrc
