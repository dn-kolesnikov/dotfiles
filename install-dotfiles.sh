#!/usr/bin/env bash

mkdir -p ~/.config/kitty
mkdir -p ~/.config/lf
mkdir -p ~/.config/mvi
mkdir -p ~/.config/nvim
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/zathura
mkdir -p ~/.local/bin
mkdir -p ~/go/{bin,src,pkg}
mkdir -p ~/.tmux

if [ ! -f /usr/bin/stow ]; then
	sudo apt install -y stow
fi

stow -v -t ~ `ls -d */`

