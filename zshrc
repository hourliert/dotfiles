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

# alias
alias vim="nvim"
alias vi="vim"
alias v="vim"
alias mux="tmuxinator"
alias g="git"
alias msm="mux start monitor"
alias re="reset"

export PATH="$(yarn global bin):$PATH"

# ruby
eval "$(rbenv init -)"
alias rake='noglob rake'

# python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

# intercom
export INTERCOM_USER=thomas.hourlier
alias hammer='noglob hammer'
export AWS_DEFAULT_REGION="us-east-1"
export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.intercom_github_api_token | tr -d '\n')
source ~/.secretrc

# token with access to private intercom repositories
export INTERCOM_GITHUB_API_TOKEN=$(cat /Users/thomashourlier/.intercom_github_api_token | tr -d '\n')
export HONEYCOMB_DEVELOPMENT_KEY=d60bffd0094a09ed32d03904948b2e7c

# Use Hammer for assume-role
alias assume-role='function(){eval $(hammer assume-role $@);}'

# Use Interstack v2 for Pilot
export PILOT_USE_INTERSTACK_V2=true

# initialize pilot environment variables
eval $(pilot env)
if [ -e ~/.pilot/stack/.pilot-env ]; then
  source ~/.pilot/stack/.pilot-env
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

. "$HOME/.local/bin/env"
export OPENBLAS="/opt/homebrew/opt/openblas"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local version="$(cat "${nvmrc_path}")"
    if nvm ls "$version" &>/dev/null; then
      nvm use --silent "$version"
    else
      nvm install --silent "$version"
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# honeycomb observability development key
export HONEYCOMB_DEVELOPMENT_KEY=$(cat /Users/thomashourlier/.intercom_honeycomb_api_token | tr -d '\n')

# SSH Agent auto-start (added by ai-infra tool)
if [ -z "$SSH_AUTH_SOCK" ]; then
# Start ssh-agent and export variables
eval "$(ssh-agent -s)" >/dev/null

# Add GitHub SSH key if it exists
if [ -f ~/.ssh/id_ed25519 ]; then
ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi
fi
export PATH=/Users/thomashourlier/.bin:$PATH

alias claude="/Users/thomashourlier/.claude/local/claude"

# added by answerbot
export PYX_API_KEY="sk-pyx-uU0Yb4gUX6XeN8XiHSsga0x5uoDfG8j4EExgCSsDZaFNs6R9fv0rQavnhSt59QB1"
# added by answerbot/script/bootstrap
export PYX_API_KEY="sk-pyx-IXDuCKDiBBzgh0p86TtrD9NfDskFtxbu5PuaCVzXHG9gwdjMRX52hAcP2wI5suK1"
