# plugins
export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
alias git=git
source $ZPLUG_HOME/init.zsh
setopt prompt_subst
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
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

# intercom
eval "$(intercom-profile)"
export INTERCOM_USER=thomas.hourlier
export INTERCOM_DEV_ENV=Linux
export INTERCOM_PAPERCLIP_S3_ENABLED=true
export AWS_ACCOUNT_ROLE=team-operator
export PATH=/home/linuxbrew/.linuxbrew/Cellar/pilot/2.9.1/bin:$PATH
eval $(pilot env)
export AWS_DEFAULT_REGION="us-east-1"
export PATH=$HOME/.eshead/bin:$PATH
alias hammer='noglob hammer'
source ~/src/data-env/profile

# alias
alias vim="nvim"
alias vi="vim"
alias v="vim"
alias mux="tmuxinator"
function git(){hub $@}
# alias git="hub"
alias g="git"
alias msm="mux start monitor"
alias psi="pilot shell intercom"
alias psic="pilot exec intercom rails c"
alias psip="pilot exec intercom pry-remote"

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
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"

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

# terraform
export PATH="/home/linuxbrew/.linuxbrew/opt/terraform@0.11/bin:$PATH"

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

source ~/.secretrc

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/thomas.hourlier/GCP/google-cloud-sdk/path.zsh.inc' ]; then . '/home/thomas.hourlier/GCP/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/thomas.hourlier/GCP/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/thomas.hourlier/GCP/google-cloud-sdk/completion.zsh.inc'; fi

party-letters() { ruby -e 'puts ARGV.join(" ").split("").map { |c| "abcdefghijklmnopqrstuvwxyz".include?(c.downcase) ? ":party-letter-#{c.downcase}:" : c }.join("")' "$@" }
