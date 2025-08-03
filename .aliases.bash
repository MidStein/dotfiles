alias mv='mv -i'
alias rm='rm -I'
alias cp='cp -i'

alias ..='cd ..'

alias ssh-addgent='eval `ssh-agent`; ssh-add'
alias fdf='fd -t f . ~ | fzf'

rand() { python ~/scripts/rand.py "$@"; }
xdg-open() { command xdg-open "$(realpath "$1")"; }
git() {
  if [ "$1" = "init" ]; then
    command git init && \
      cp ~/scripts/commit-msg .git/hooks/commit-msg && \
      chmod u+x $_
  else
    command git "$@"; fi;
}
files-modified-today() {
  find ~/.local/state/nvim/undo/ -daystart -mtime -1 -printf "%T@ %p\n" \
    | sort -n \
    | cut -d ' ' -f 2- \
    | cut -d '%' -f 4- \
    | tr '%' '/' \
    | sed 's/.*/~\/\0/' \
    | less
}
tmux-workspace() { bash ~/scripts/tmux-workspace.bash "$@"; }
cpwd() { pwd | wl-copy; }
poweroff() {
  pidof chrome >> /dev/null
  if [[ "$?" == 0 ]]; then
    echo 'Chrome is still open'
    return
  fi
  tmux ls >> /dev/null
  if [[ "$?" == 0 ]]; then
    echo 'tmux is still running'
    return
  fi
  command poweroff
}
pyscript() { python ~/code/python/script/script.py "$@"; }
