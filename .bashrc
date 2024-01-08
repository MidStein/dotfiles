case $- in
  *i*) ;;
    *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

if [[ -x /usr/bin/dircolors ]]; then
  if [[ -r ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

#colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

. "$HOME/.cargo/env"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim

export PATH="/mnt/c/Windows/System32:$PATH"

export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

export PATH="$HOME/clone/language-servers/dart-sass:$PATH"
export PATH="$HOME/clone/language-servers/lua-language-server-3.7.3/bin:$PATH"
export PATH="$HOME/clone/language-servers/clangd_17.0.3/bin:$PATH"

export LESS='FiQR'
export BAT_THEME="Solarized (light)"

if [ -f ~/.aliases ]; then
  # shellcheck source=/dev/null
  source ~/.aliases
fi

PS1='\[\033[01;34m\]\w\[\033[00m\]\n\$ '

set +o histexpand

source /usr/share/doc/fzf/examples/key-bindings.bash
eval "$(zoxide init bash)"
# shellcheck source=/dev/null
source <(kubectl completion bash)

if [ -f "$HOME/clone/bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$HOME/clone/bash-git-prompt/gitprompt.sh"
fi

