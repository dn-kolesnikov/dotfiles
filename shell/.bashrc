#!/usr/bin/env bash
# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ctrl-s and ctrl-q.
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# Infinite history.
HISTSIZE= HISTFILESIZE=

# ignore duplicate commands
HISTCONTROL=erasedups:ignoreboth
PROMPT_COMMAND="history -n; history -w; history -c; history -r"
tac "$HISTFILE" | awk '!a[$0]++' | tac > /tmp/t; mv /tmp/t "$HISTFILE"

# append to the history instead of overwriting (good for multiple connections)
shopt -s histappend

# Source aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# command PROMPT
function _update_ps1() {
    PS1="$($HOME/go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$HOME/go/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

complete -C /home/dk/go/bin/gocomplete go
