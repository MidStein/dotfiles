case $- in
  *i*) ;;
  *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

if [[ -x /usr/bin/dircolors ]]; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


export EDITOR=vim

export LESS='FiQR'

set +o histexpand

# shellcheck source=/dev/null
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

