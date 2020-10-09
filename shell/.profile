#!/usr/bin/env bash
# Profile file. Runs on login.

export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 2)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_me=$(tput sgr0)

export BROWSER="firefox"
export EDITOR="nvim"
export FILE="lf"
export READER="zathura"
export TERMINAL="kitty"

if [ $USER ]; then
	export XDG_CACHE_HOME="/tmp/${USER}/.cache"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
fi

# set PATH so it includes golang's private bin if it exists
if [ -d "$HOME/go/bin" ] ; then
    export PATH="$PATH:$HOME/go/bin"
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ] ; then
    export GDK_BACKEND=wayland
    export MOZ_ENABLE_WAYLAND=1
fi

echo "$0" | grep "bash$" >/dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# Modular visual interface for GDB in Python
# https://github.com/cyrus-and/gdb-dashboard
[ ! -f "$HOME/.gdbinit" ] && wget -P $HOME git.io/.gdbinit >/dev/null 2>&1

# Start graphical server if bspwm not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx

