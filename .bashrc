[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


export NVM_DIR="$HOME/.config/nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

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

export BAT_THEME='Solarized (light)'
export LS_COLORS=''
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/

set +o histexpand

[[ -f "$HOME/.aliases.bash" ]] && source "$HOME/.aliases.bash"

[[ -f "$HOME/.local/lib/bash-git-prompt/gitprompt.sh" ]] && \
  source "$HOME/.local/lib/bash-git-prompt/gitprompt.sh"

hash zoxide && eval "$(zoxide init bash)"

export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${SONAR_SCANNER_HOME}/bin:${PATH}"

export PATH="${XDG_DATA_HOME}/gem/ruby/3.3.0/bin:${PATH}"
