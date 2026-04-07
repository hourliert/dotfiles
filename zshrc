# plugins
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
setopt prompt_subst
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# starship prompt (configured in ~/.config/starship.toml)

# start zplug
zplug load


# alias
alias vim="nvim"
alias vi="vim"
alias v="vim"
alias mux="tmuxinator"
alias g="git"
alias msm="mux start monitor"
alias re="reset"

export PATH="$(yarn global bin):$PATH"
# Jupyter kernel paths for nvim/molten and Cursor
# TEMPORARILY DISABLED FOR TESTING - uncomment if Cursor works without it
# export JUPYTER_PATH="$HOME/Library/Jupyter:$HOME/src/answerbot/.venv/share/jupyter:${VIRTUAL_ENV:+$VIRTUAL_ENV/share/jupyter}"

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

# starship prompt
eval "$(starship init zsh)"

source ~/.secretrc
