# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# setup
export TZ="UTC+0"
export ARCHFLAGS="-arch x86_64"
export LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
setopt interactive_comments
setopt HIST_IGNORE_SPACE

# for fast v-mode | side effect no key comb
export KEYTIMEOUT=1

git_prompt(){
	git  rev-parse --git-dir &> /dev/null || return 1
	echo -n "%{[1;31m%}["
	echo -n "%{[0;31m%}$(git symbolic-ref --short HEAD 2> /dev/null || echo Error )"

	git diff --quiet &> /dev/null || echo -n "✗"
	echo -n "]%{[0;35m%}"


}
# enable functions inside PROMPT
setopt PROMPT_SUBST
PROMPT="%{[1;94m%}[%c]\$(git_prompt)%(?:%{[00;32m%}$:%{[00;31m%}$) %{[00m%}"
# improve tab completion
autoload -Uz compinit
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # no case sensitive

echo -ne '\e[5 q' # Use beam shape cursor on startup.


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

find_config () {
	own_path="$(find ~/.config -maxdepth 2 -printf "%P\n" | fzf)"
	if [ -z $_own_path]
	then
		nvim ~/.config/$own_path
	fi
}

bindkey -s '^o' 'lfcd\n'
bindkey -s '^xf' 'find_config\n'

# Key Binding
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

### Alias

# Basic
alias vim='nvim'
alias v='nvim'

alias g='git'
alias gs='git status'
alias gc='git checkout'
alias gco='git commit'
alias gp='git push'

alias -- l='ls -lah'
alias -- ll='ls -lAh'
alias -- ls='ls --color=auto'
alias -- md='mkdir -p'

alias -- -='cd -'
alias -- ..='cd ..'
alias -- ...='cd ../..'
alias -- 1='cd -'
alias -- 2='cd -2'
alias -- 3='cd -3'
alias -- 4='cd -4'
alias -- 5='cd -5'
alias -- 6='cd -6'
alias -- 7='cd -7'
alias -- 8='cd -8'
alias -- 9='cd -9'

alias -- _='sudo '
alias grep='grep --color=auto'

alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Git
alias config='/usr/bin/git --git-dir=$HOME/projects/.dotfiles/ --work-tree=$HOME'

##  ARCH LINUX 
if [ -f /etc/arch-release ]
	then
	# pacman
	alias pac='sudo pacman -S'   # install
	alias pacu='sudo pacman -Syu'    # update, add 'a' to the list of letters to update AUR packages if you use yaourt
	alias pacr='sudo pacman -Rs'   # remove
	alias pacs='pacman -Ss'      # search
	alias paci='pacman -Si'      # info
	alias paclo='pacman -Qdt'    # list orphans
	alias pacro='paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
	alias paco='sudo pacman -Scc'    # clean cache
	alias paclf='pacman -Ql'   # list files

fi
## Void Linux
if [ -f /etc/void-release ]
	then
	# xbps
	
	alias xup='sudo xbps-install -Syuv'
	alias xin='sudo xbps-install -S'
	alias xq='sudo xbps-query'
	alias xf='sudo xbps-query -Rs'
	alias xm='sudo xbps-query -m'
	alias xhome='sudo xbps-query -p homepage'

fi

if [ -s "$NVM_DIR/nvm.sh" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi

##Others
alias fl="flutter"
alias tsm="transmission-remote"

alias tsm='transmission-remote --list'
alias tsm-count='echo "Blocklist rules:" $(curl -s --data \
	'{"method": "session-get"}' localhost:9091/transmission/rpc -H \
	"$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
	| cut -d: -f 11 | cut -d, -f1)'
alias tsm-daemon='transmission-daemon'
alias tsm-quit='killall transmission-daemon'
alias tsm-altspeedenable='transmission-remote --alt-speed'
alias tsm-altspeeddisable='transmission-remote --no-alt-speed'
alias tsm-add='transmission-remote --add "$1"'
alias tsm-askmorepeers='transmission-remote -t"$1" --reannounce'
alias tsm-pause='transmission-remote -t"$1" --stop	'	# <id> or all
alias tsm-start='transmission-remote -t"$1" --start	'	# <id> or all
alias tsm-purge='transmission-remote -t"$1" --remove-and-delete '
alias tsm-remove='transmission-remote -t"$1" --remove	'	# leaves data alone
alias tsm-info='transmission-remote -t"$1" --info'
alias tsm-speed='while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done'

# Functions
_md(){
	mkdir -p -- "$1" && cd -P -- "$1"
}

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/projects/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
