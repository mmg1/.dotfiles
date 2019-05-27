#!/bin/bash

lang=$(setxkbmap -query | tail -1 | grep -oP '\w\w$')

if [[ $lang = 'eu' ]]
then
    setxkbmap fr
    xkbcomp -w0 -I/home/florian/.xkb /home/florian/.xkb/keymap/mykbd_fr :0.0
elif [[ $lang = 'fr' ]]
then
    setxkbmap eu
    xkbcomp -w0 -I/home/florian/.xkb /home/florian/.xkb/keymap/mykbd_eu :0.0
fi
