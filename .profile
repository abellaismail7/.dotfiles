export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox"

export PATH=$HOME/.local/bin:$PATH


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export NVM_DIR="${XDG_CONFIG_HOME}/nvm"

# source lf icons
source $XDG_CONFIG_HOME/lf/icons

source /usr/share/nvm/init-nvm.sh
source "$XDG_DATA_HOME/st.dircolors"

export SUDO_ASKPASS=~/.local/bin/dpass
export MANPAGER="nvim +Man!"
