# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# https://missing.csail.mit.edu/2020/editors/
export EDITOR=vim

# https://missing.csail.mit.edu/2020/command-line/
# Test if ~/.aliases exists and source it
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# https://github.com/magicmonty/bash-git-prompt#installation
if [ -f "$HOME/clone/bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$HOME/clone/bash-git-prompt/gitprompt.sh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://unix.stackexchange.com/a/408419
export SYSTEMD_EDITOR=vim

# Add a new line at the end of the command prompt
PS1='\[\033[01;34m\]\w\[\033[00m\]\n\$ '

source /usr/share/fzf/shell/key-bindings.bash

# automatically added when installing rust
. "$HOME/.cargo/env"

export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# https://stackoverflow.com/a/36726662/16328664
# https://stackoverflow.com/a/6451487/16328664
export LESS='FiQR'

# default had hard to see white text
# https://github.com/sharkdp/bat#highlighting-theme
export BAT_THEME="Solarized (light)"

export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

eval "$(zoxide init bash)"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH="$HOME/clone/dart-sass:$PATH"

