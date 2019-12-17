#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec bspwm
