# Add deno completions to search path
if [[ -d "$HOME/.zsh/completions" ]] && [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi
# ZSH
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color

plugins=(
  git
  dotenv
  asdf
)

# Bootstrap Homebrew first (check known locations)
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# plugins
export BREW_PREFIX="$( brew --prefix )"
export ZPLUG_HOME="$BREW_PREFIX/opt/zplug"
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
alias mux="tmuxinator"
alias msm="mux start monitor"
alias re="reset"

# fzf: fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# neovim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export EDITOR="nvim"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ruby
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi

# go
# export PATH="$( go env GOPATH )/bin:$PATH"

# android (macOS only)
if [[ "$(uname)" == "Darwin" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
  export PATH="$JAVA_HOME/bin:$PATH"
  export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
fi

# python
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# . "$HOME/.local/bin/env"

# alias claude="/Users/thomashourlier/.claude/local/claude"
# . "/Users/thomashourlier/.deno/env"
# Initialize zsh completions (added by deno install script)
# autoload -Uz compinit
# compinit
# Docker CLI completions
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)
fi
autoload -Uz compinit
compinit

# Start ssh-agent if not running (Linux only)
if [[ "$(uname)" == "Linux" ]]; then
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)" > /dev/null
    fi
fi

[[ -f ~/.secretrc ]] && source ~/.secretrc

# Machine-specific config (create ~/.localrc on each machine)
[[ -f ~/.localrc ]] && source ~/.localrc

# starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# mise
if command -v mise &>/dev/null; then
  [[ "$(uname)" == "Darwin" ]] && export MISE_ENV=macos
  eval "$(mise activate zsh)"
fi
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export RACK_ENV=development
export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# pnpm
if [[ "$(uname)" == "Darwin" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi
if [[ -d "$PNPM_HOME" ]]; then
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

# bun
if [[ -d "$HOME/.bun" ]]; then
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi
