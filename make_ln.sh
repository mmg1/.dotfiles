#!/bin/bash

cur=/home/florian/.dotfiles
home_florian=/home/florian

function make_ln {
    rm $1
    ln $2 $1
}

make_ln $cur/i3_config $home_florian/.config/i3/config
make_ln $cur/i3status_config $home_florian/.config/i3status/config
make_ln $cur/.vimrc $home_florian/.vimrc
make_ln $cur/.tmux.conf $home_florian/.tmux.conf
make_ln $cur/.bashrc $home_florian/.bashrc
make_ln $cur/.bash_aliases $home_florian/.bash_aliases
make_ln $cur/.inputrc $home_florian/.inputrc
make_ln $cur/.keymap.xkb $home_florian/.keymap.xkb
make_ln $cur/.gdbinit $home_florian/.gdbinit
