# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=()

# Git Prompt Customization
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH=""

source $ZSH/oh-my-zsh.sh


# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Rust (after Homebrew so cargo/rustc take priority over Homebrew's rust)
export PATH="$HOME/.cargo/bin:$PATH"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

# Expo / Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# File searching fzf + fd
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# Aliases
alias vim=nvim
alias venv="source .venv/bin/activate"
alias cpwd='pwd | tr -d "\n" | pbcopy'

# Editor
export EDITOR=vim

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Prompt (must be after oh-my-zsh source to override theme)
function git_branch_prompt() {
  local branch=$(git_current_branch)
  if [[ -n "$branch" ]]; then
    echo " ($branch) ~"
  else
    echo " ~"
  fi
}

PROMPT='%F{244}[%D{%H:%M}]%f %F{cyan}%n:%f%F{yellow}%1~%f%F{red}$(git_branch_prompt)%f '

# bun completions
[ -s "/Users/nathan/.bun/_bun" ] && source "/Users/nathan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
