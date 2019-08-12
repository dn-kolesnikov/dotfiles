#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec bspwm
