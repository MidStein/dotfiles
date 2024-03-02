if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


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


export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

export PATH="$HOME/clone/language-servers/dart-sass:$PATH"
export PATH="$HOME/clone/language-servers/lua-language-server-3.7.3/bin:$PATH"
export PATH="$HOME/clone/language-servers/clangd_17.0.3/bin:$PATH"

export BAT_THEME="Solarized (light)"

set +o histexpand

# shellcheck source=/dev/null
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

[[ -f /usr/share/fzf/shell/key-bindings.bash ]] && \
  source "/usr/share/fzf/shell/key-bindings.bash"

# shellcheck source=/dev/null
[[ -f "$HOME/clone/bash-git-prompt/gitprompt.sh" ]] && \
  source "$HOME/clone/bash-git-prompt/gitprompt.sh"

# shellcheck source=/dev/null
[[ -f "/home/deepak/.ghcup/env" ]] && source "/home/deepak/.ghcup/env"

# shellcheck source=/dev/null
hash kubectl && source <(kubectl completion bash)

hash zoxide && eval "$(zoxide init bash)"

