# Dotfiles

**`$HOME` sweet `$HOME`**

I live in the terminal. Here are three reasons why in particular:

- No need for closing and opening multiple graphical applications for different tasks
- The terminal is simple. Every command line tool does it's own thing and is
  well documented
- It taught me the basics of operating systems and application software better
  than any course ever did

This means that I often need to change stuff in and add stuff to my dotfiles.
That's why I put them on version control.

## .aliases

### Types of aliases based on need

- Safety. Prevent accidental loss of data when using `mv`, `cp` or `rm`
- Frequent use in short bursts. `..=cd ..` and `gs=git status`
- Periodic use. `ssh-addgent`
- Too long

## .bashrc

### Order of contents

- Standard Ubuntu .bashrc with comments and some unused parts removed
- Environment variables that (I think) would go into .profile for a
  non-interactive shell (GUI applications)
- Standard shell environment variables
- Directories for `$PATH`
- Environment variables for configuring installed programs
- Shell options
- Sourcing of more bash files
- Running `eval` for initializing some installed programs

## .inputrc

Turn off bell sounds. Use vi bindings when interacting with the shell.

```bash
set bell-style none
set editing-mode vi
```

## .tmux.conf

Tmux is an integral part of my workflow. Look at my [scripts
repo](https://github.com/MidStein/scripts) to see how I set it up.

### Order of contents

- Use C-a as prefix
- Options that take off or on (boolean) arguments
- Options that take numerical arguments
- Options that take an empty string argument
- Options that take string arguments
- Use tmux-yank for copying from the tmux to system
- Custom bindings

## init.lua

Initialization file for [NeoVim](https://neovim.io/): the hyperextensible
editor. This one changes the most often because I add/modify/remove
plugins/language servers/key mappings often.

### Order of contents

- Options
  - Options set to false
  - Options set to true
  - Options set to numerical values
  - Options set to strings
  - Removing items from an option
  - Adding items to an option
  - Netrw options
- Custom autocommands
- Workaround for yanking text to Windows clipboard
- Plugins
  - Plugins list with vim-plug
  - Setting variables of vimscript plugins
  - Setups for [top lua plugins](https://dotfyle.com/neovim/plugins/top).
    Includes keybinds and language servers list
  - Setups for other lua plugins
- Custom mappings. I use two &lt;Leader&gt; keys and an alphabet key. Bindings
  that use characters from the end of the alphabet are for opening files that I
  edit very often

---

Big thanks to [The Missing Semester](https://missing.csail.mit.edu/) for
introducing me to the command line experience.
