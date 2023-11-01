#!/usr/bin/env bash
# Profile file. Runs on login.

export BROWSER="yandex-browser"
export EDITOR="nvim"
export FILE="lf"
export READER="zathura"
export TERMINAL="kitty"

#if [ "$XDG_SESSION_TYPE" = "wayland" ] ; then
#export GDK_BACKEND=wayland
#export MOZ_ENABLE_WAYLAND=1
#export MOZ_WEBRENDER=1
#export QT_QPA_PLATFORM=wayland
#export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#fi

#export XDG_CONFIG_HOME="$HOME/.config"
#export XDG_DESKTOP_DIR="$HOME/desktop"
#export XDG_DOCUMENTS_DIR="$HOME/documents"
#export XDG_DOWNLOAD_DIR="$HOME/downloads"
#export XDG_MUSIC_DIR="$HOME/music"
#export XDG_PICTURES_DIR="$HOME/pictures"
#export XDG_PUBLICSHARE_DIR="$HOME/public"
#export XDG_TEMPLATES_DIR="$HOME/templates"
#export XDG_VIDEOS_DIR="$HOME/videos"
#export XDG_CACHE_HOME="/tmp/${USER}/cache"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.cargo/bin" ] && export PATH="$PATH:$HOME/.cargo/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"
[ -d "/usr/local/go/bin" ] && export PATH="$PATH:/usr/local/go/bin"

# Start graphical server if it not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway

