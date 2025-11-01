[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export LESS=FiQR

export BAT_THEME='Solarized (light)'
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/
export LS_COLORS=''

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS='/usr/local/share/:/usr/share/'
export XDG_CONFIG_DIRS='/etc/xdg'

HISTCONTROL=ignoredups
set +o histexpand

source "$HOME/.aliases.bash"
source "$HOME/.local/lib/bash-git-prompt/gitprompt.sh"

eval "$(zoxide init bash)"
