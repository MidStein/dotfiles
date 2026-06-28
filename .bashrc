[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


export PATH="/home/deepak/.local/bin:$PATH"

export BAT_THEME='Solarized (light)'
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/
export LESS=FiQR
export LS_COLORS=''
export SYSTEMD_EDITOR=nvim

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS='/usr/local/share/:/usr/share/'
export XDG_CONFIG_DIRS='/etc/xdg'

HISTCONTROL=ignoredups
set +o histexpand

source "$HOME/.aliases.bash"
source /usr/lib/bash-git-prompt/gitprompt.sh

eval "$(zoxide init bash)"
