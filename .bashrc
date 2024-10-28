[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


export NVM_DIR="$HOME/.config/nvm"
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# shellcheck source=/dev/null
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

HISTCONTROL=ignoredups

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS='/usr/local/share/:/usr/share/'
export XDG_CONFIG_DIRS='/etc/xdg'

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export LESS='FiQR'

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export BAT_THEME='Solarized (light)'
export LS_COLORS=''

set +o histexpand

# shellcheck source=/dev/null
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# shellcheck source=/dev/null
[[ -f "$HOME/.local/lib/bash-git-prompt/gitprompt.sh" ]] && \
  source "$HOME/.local/lib/bash-git-prompt/gitprompt.sh"

hash zoxide && eval "$(zoxide init bash)"
