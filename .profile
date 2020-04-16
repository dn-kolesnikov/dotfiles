#!/usr/bin/env sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export BROWSER="firefox"
export EDITOR="nvim"
export FILE="ranger"
export READER="zathura"
export TERMINAL="kitty"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

echo "$0" | grep "bash$" >/dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# Modular visual interface for GDB in Python
# https://github.com/cyrus-and/gdb-dashboard
[ ! -f "$HOME/.gdbinit" ] && wget -P $HOME git.io/.gdbinit >/dev/null 2>&1

# Start graphical server if bspwm not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx

