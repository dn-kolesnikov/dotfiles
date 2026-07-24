#!/usr/bin/env sh

mkdir -p ~/.config/kanata
mkdir -p ~/.config/kitty
mkdir -p ~/.config/mvi
mkdir -p ~/.config/niri
mkdir -p ~/.config/nvim
mkdir -p ~/.config/systemd/user
mkdir -p ~/.config/yazi
mkdir -p ~/.config/zathura
mkdir -p ~/.local/bin
mkdir -p ~/.tmux
mkdir -p ~/go/{bin,src,pkg}

if [ ! -f /usr/bin/stow ]; then
	sudo paru -Sy stow
fi

$(which stow) -v -t ~ $(ls -d */)
