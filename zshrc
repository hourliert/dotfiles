# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/thomashourlier/.zsh/completions:"* ]]; then export FPATH="/Users/thomashourlier/.zsh/completions:$FPATH"; fi
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
eval "$(rbenv init -)"

# go
# export PATH="$( go env GOPATH )/bin:$PATH"

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

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
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/thomashourlier/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Start ssh-agent if not running (Linux only)
if [[ "$(uname)" == "Linux" ]]; then
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)" > /dev/null
    fi
fi

source ~/.secretrc

# Machine-specific config (create ~/.localrc on each machine)
[[ -f ~/.localrc ]] && source ~/.localrc

# starship prompt
eval "$(starship init zsh)"
export MISE_ENV=macos # loads mise.macos.toml
eval "$(mise activate zsh)"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export RACK_ENV=development
export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/thourlier/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/thourlier/.bun/_bun" ] && source "/Users/thourlier/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
