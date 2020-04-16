#!/usr/bin/env bash

# Disable ctrl-s and ctrl-q.
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# Infinite history.
HISTSIZE= HISTFILESIZE=

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Source aliases
[ -f "$HOME/.bash_aleases" ] && source "$HOME/.bash_aliases"

# enable bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

