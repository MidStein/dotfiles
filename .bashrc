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

#colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi


export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# shellcheck source=/dev/null
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export LESS='FiQR'


export PATH="$HOME/.local/texlive/2023/bin/x86_64-linux:$PATH"

export PATH="$HOME/clone/language-servers/dart-sass:$PATH"
export PATH="$HOME/clone/language-servers/lua-language-server-3.7.3/bin:$PATH"
export PATH="$HOME/clone/language-servers/clangd_17.0.3/bin:$PATH"

export DENO_INSTALL="/home/deepak/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export BAT_THEME="Solarized (light)"

set +o histexpand

# shellcheck source=/dev/null
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

[[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && \
  source "/usr/share/doc/fzf/examples/key-bindings.bash"

# shellcheck source=/dev/null
[[ -f "$HOME/clone/bash-git-prompt/gitprompt.sh" ]] && \
  source "$HOME/clone/bash-git-prompt/gitprompt.sh"

# shellcheck source=/dev/null
source <(ng completion script)

# shellcheck source=/dev/null
hash kubectl && source <(kubectl completion bash)

hash zoxide && eval "$(zoxide init bash)"

