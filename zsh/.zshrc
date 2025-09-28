export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.emacs.d/bin:$PATH"

alias vim='nvim'
alias emacs='emacs -nw'
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias python=python3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

# Created by `pipx` on 2025-08-07 02:28:10
export PATH="$PATH:/Users/nevil/.local/bin"
