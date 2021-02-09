export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

export PATH=~/.local/bin:$PATH
export SUDO_ASKPASS=~/.local/bin/dpass

# source lf icons
source $XDG_CONFIG_HOME/lf/icons

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

