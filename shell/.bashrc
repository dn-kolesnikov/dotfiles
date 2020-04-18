#!/usr/bin/env bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ctrl-s and ctrl-q.
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# Infinite history.
HISTSIZE= HISTFILESIZE=

# Source aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# powerline shell PS1
function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

