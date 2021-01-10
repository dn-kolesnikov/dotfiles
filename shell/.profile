#!/usr/bin/env bash
# Profile file. Runs on login.

[[ $- != *i* ]] && exit

export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

export BROWSER="firefox"
export EDITOR="nvim"
export FILE="lf"
export READER="zathura"
export TERMINAL="alacritty"

#if [ "$XDG_SESSION_TYPE" = "wayland" ] ; then
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_PUBLICSHARE_DIR="$HOME/public"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_VIDEOS_DIR="$HOME/videos"
#export XDG_CACHE_HOME="/tmp/${USER}/cache"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# set PATH so it includes golang's private bin if it exists
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"

# Modular visual interface for GDB in Python
# https://github.com/cyrus-and/gdb-dashboard
#[ ! -f "~/.gdbinit" ] && wget -P ~ git.io/.gdbinit >/dev/null 2>&1

# Start graphical server if it not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway


