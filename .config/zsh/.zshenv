# export EDITOR="nvim"
# export VISUAL="nvim"
# export TERMINAL="alacritty"
# export BROWSER="firefox"

# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CACHE_HOME="$HOME/.cache"

#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#
#export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
#
#export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
#
#export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
#
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#
#export CARGO_HOME="$XDG_DATA_HOME"/cargo
#export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
#
#export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
#
#export PYLINTHOME="${XDG_CACHE_HOME}"/pylint
#
#export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#
#export GOPATH="$XDG_DATA_HOME"/go
#export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
#
#export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
#export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
#export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
#
#export TERMINFO="$XDG_DATA_HOME"/terminfo
#export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export SXHKD_SHELL="/bin/sh"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--reverse
--prompt="  "
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
