# Dotfiles

Config files for my Linux software.

---

### Items

- [.aliases.bash](#aliasesbash)
- [.bashrc](#bashrc)
- [curlrc](#curlrc)
- [git](#git)
- [.inputrc](#inputrc)
- [nvim](#nvim)
- [sqlite3](#sqlite3)
- [systemd](#systemd)
- [tmux](#tmux)
- [zathura](#zathura)
- [Acknowledgement](#acknowledgement)

---

## .aliases.bash

### Aliases

- Safety confirmation. Prevent accidental loss of data when using `cp`, `mv`
  and `rm`
- `..` to quickly cd to parent directory
- `ssh-addgent` to use ssh-agent to update git repository information on my
  bash prompt without it repeatedly asking for my ssh credentials. I run it as
  the first thing on my terminal.
- `fdf` to fuzzily display all files from my home directory. Useful to combine
  with `xdg-open` and `realpath $(dirname ) | wl-copy`

### Functions

- rand: Pick random lines from stdin. Useful with `seq`.
- xdg-open: xdg-open does not work with relative paths outside the current
  directory and it's descendants for some reason.
- git: During Git init, add commit hook to never allow commit subjects longer
  than 50 characters.
- files-modified-today: List files modified today using nvim undo files. Useful
  to remind myself what I did on a particular day.
- tmux-workspace: Start a tmux session setup which suits my working style.
  Usually, the second command I run after my terminal autostart.
- cpwd: Copy the path of the current working directory. Useful for pasting to
  the download location prompt dialogue when I download something using my
  browser.
- poweroff: Don't power off until chrome and tmux are closed. Chrome sometimes
  says it shut down unexpectedly after booting up.
- pyscript: Run my dedicated python script file. Using the same file means I
  can just undo to an interesting script that I want to run once again, thanks
  to nvim's persistent history.

## .bashrc

- ls and grep should show coloured output for stdout.
- Load node using nvm (node version manager).
- Don't write duplicates in bash history.
- Use XDG recommended environment variables.
- Use nvim for EDITOR and SYSTEMD_EDITOR environment variables.
- Use `FiQR` for less which means quit if one screen, ignore case, quiet and
  raw control chars.
- Use solarized light theme for bat.
- Declare JAVA_HOME environment variable.
- Turn off histexpand, so that ! character is not handled differently while
  writing commands.
- Source .aliases.bash.
- Source bash-git-prompt.
- Use zoxide.

## curlrc

Don't join the starting of the new prompt to the output of curl.

## git

- config: same thing as ~/.gitconfig. Use delta as pager. git graph alias.
  merge conflict style: diff3
- ignore
  - Session.vim: file used to save nvim in a particular state (called session
    in nvim)
  - .nvim.lua: custom nvim settings for a project
  - todo.md: to-do list
  - notes.md: notes

## .inputrc

Turn off bell sounds. Use vi bindings when interacting with the shell.

## nvim

Nvim configuration files.

## sqlite3

- output display mode: column
- indicate null value by NULL

## systemd

Systemd services

- gmail-notifier: Every 5 minutes, check for unread gmails and show desktop
  notifications for any.
- reminders: Sets reminders for tasks throughout the day by scheduling gmails.
- check-battery: Check and notify if battery is charged to 100%.

## tmux

- Use C-a as prefix.
- Be able to use mouse.
- Allow focus events to be passed to applications running in tmux.
- Don't wait for esc as part of a key sequence.
- Don't set up anything on the right of status line by default.
- Keep using Emacs bindings in status line command prompt.

## zathura

- Use grey background instead of a pitch black one.
- Display vertical scrollbar.
- Use SQLite as a database backend as the default plain is deprecated.
- Copy to the regular clipboard.
- Use ~ in status bar to indicate $HOME.
- Unmap d, which toggles dual page view.

## Acknowledgement

I was introduced to this Linux terminal way by the course "[The Missing
Semester of your CS Education](https://missing.csail.mit.edu/)". Huge thanks to
the lecturers.
