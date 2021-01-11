#!/usr/bin/env bash

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/lf
mkdir -p ~/.config/mvi
mkdir -p ~/.config/nvim
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/zathura
mkdir -p ~/.local/bin
mkdir -p ~/go/{bin,src,pkg}

stow -v -t ~ `ls -d */`

