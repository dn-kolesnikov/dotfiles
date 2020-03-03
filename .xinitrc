#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && source "$HOME/.xprofile"

exec bspwm
