#!/bin/bash

home_florian=/home/florian
echo -e '[Desktop Entry]\nName=keyboard_setup\nExec=/bin/bash -c "test -f $HOME/.keymap.xkb && xkbcomp $HOME/.keymap.xkb $DISPLAY"\nType=Application' > $home_florian/.config/autostart/keyboard_setup.desktop
xkbcomp $home_florian/.keymap.xkb $DISPLAY &> /dev/null
