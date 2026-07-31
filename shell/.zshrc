# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	archlinux
	colorize
	command-not-found
	genpass
	git
	golang
	k9s
	pass
	sudo
	tmux
	vi-mode
	fzf		# после vi-mode для биндинга CTRL+R
	z
)

ZSH_TMUX_AUTOSTART=true
VI_MODE_SET_CURSOR=true

HISTORY_IGNORE="(ls|cd|pwd|exit|man)*"
setopt EXTENDED_HISTORY      # Делать записи в файле истории в формате ':start:elapsed;command'.
setopt INC_APPEND_HISTORY    # Писать данные в файл истории немедленно, а не тогда, когда осуществляется выход из оболочки.
setopt SHARE_HISTORY         # Использовать во всех сессиях общее хранилище истории.
setopt HIST_IGNORE_DUPS      # Не делать повторную запись о только что записанном событии.
setopt HIST_IGNORE_ALL_DUPS  # Удалять старую запись о событии в том случае, если новое событие является дубликатом старого.
setopt HIST_IGNORE_SPACE     # Не делать записи о командах, начинающихся с пробела.
setopt HIST_SAVE_NO_DUPS     # Не записывать дубликаты событий в файл истории.
setopt HIST_VERIFY           # Перед выполнением команд показывать записи о них из истории команд.
setopt APPEND_HISTORY        # Добавлять записи к файлу истории (по умолчанию).
setopt HIST_NO_STORE         # Не хранить записи о командах history.
setopt HIST_REDUCE_BLANKS    # Убирать лишние пробелы из командных строк, добавляемых в историю.

source $ZSH/oh-my-zsh.sh

# User configuration

export BROWSER="yandex-browser-stable"
export EDITOR="nvim"
export FILE="yazi"
export READER="zathura"
export TERMINAL="kitty"

#if [ "$XDG_SESSION_TYPE" = "wayland" ] ; then
#export CLUTTER_BACKEND=wayland
#export GDK_BACKEND=wayland
#export SDL_VIDEODRIVER=wayland
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
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

# For Cisco AnyConnect Login to work on NVIDIA
# export WEBKIT_DISABLE_DMABUF_RENDERER=1

alias fullupgrade="sudo apt update && sudo apt full-upgrade -y; flatpak update -y"
alias mvi="mpv --config-dir=$HOME/.config/mvi"
alias curl="curl --proto '=https' --tlsv1.2"
alias copy2clipboard="xclip -sel clip"
