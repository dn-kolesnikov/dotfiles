#!/usr/bin/env sh

# autoruns
xset r rate 300 50 &                # speed xrate up
xsetroot -cursor_name left_ptr &    # change default cursor
setbg &                             # set the background
launch-bar &                        # start *bar panel
dunst &                             # dunst for notifications
sxhkd &                             # bind keys
unclutter &                         # remove mouse when idle
udiskie -t &                        # управление монитрованием накопителей
hsetroot -solid "#000000" &         # удаляет серый фон, перед запуском compton
(sleep 1 && compton) &              # compton for transparency

# start windows manager
exec bspwm

