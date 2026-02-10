# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history sudo tmux golang pass vi-mode z)

ZSH_TMUX_AUTOSTART=true
VI_MODE_SET_CURSOR=true


source $ZSH/oh-my-zsh.sh

# User configuration

export BROWSER="yandex-browser"
export EDITOR="nvim"
export FILE="lf"
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

# Start graphical server if it not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway

# For Cisco AnyConnect Login to work on NVIDIA
# export WEBKIT_DISABLE_DMABUF_RENDERER=1

alias fullupgrade="sudo apt update && sudo apt full-upgrade -y; flatpak update -y"
alias mvi="mpv --config-dir=$HOME/.config/mvi"
alias curl="curl --proto '=https' --tlsv1.2"
alias copy2clipboard="xclip -sel clip"

# Алиас для быстрого коммита и пуша с JIRA-номером из ветки
gcpmts() {
    # Проверка, что мы в Git-репозитории
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "❌ Ошибка: это не Git-репозиторий!"
        return 1
    fi

    # Получаем имя ветки и номер задачи
    local branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -z "$branch_name" ]; then
        echo "❌ Ошибка: не удалось получить имя ветки (возможно, detached HEAD)"
        return 1
    fi

    local jira_number=$(echo "$branch_name" | sed 's|.*/||')
    if [ -z "$jira_number" ]; then
        echo "❌ Ошибка: не удалось извлечь номер задачи из ветки ($branch_name)"
        return 1
    fi

    # Формируем сообщение коммита
    local commit_message="[$jira_number] ${1:-"minor update"}"

    # Выполняем коммит и пуш
    echo "➤ git commit -a -m \"$commit_message\""
    git commit -a -m "$commit_message" || return 1

    echo "➤ git push origin \"$branch_name\""
    git push origin "$branch_name"
}

#
# export GOPRIVATE=gitlab.services.mts.ru
# export GOPROXY=https://nexus.services.mts.ru/repository/go-proxy/
# export GOSUMDB="sum.golang.org https://nexus.services.mts.ru/repository/go-sum"

export ATAC_KEY_BINDINGS="~/.config/atac/vim_key_bindings.toml"

# The next line updates PATH for CLI.
if [ -f '/home/dk/yandex-cloud/path.bash.inc' ]; then source '/home/dk/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/dk/yandex-cloud/completion.zsh.inc' ]; then source '/home/dk/yandex-cloud/completion.zsh.inc'; fi

if [ -f '/home/dk/vault.env' ]; then source '/home/dk/vault.env'; fi

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /home/dk/bin/vault vault

# opencode
export PATH=/home/dk/.opencode/bin:$PATH
