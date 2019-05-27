#!/bin/bash

setxkbmap eu
xkbcomp -w0 -I/home/florian/.xkb /home/florian/.xkb/keymap/mykbd_eu :0.0
