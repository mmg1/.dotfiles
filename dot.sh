#!/bin/bash

cur=/home/florian/.dotfiles
home_florian=/home/florian

mkdir -p $home_florian/.config/i3
mkdir -p $home_florian/.config/i3status
rm $home_florian/.config/i3/config
ln $cur/i3_config $home_florian/.config/i3/config
rm $home_florian/.config/i3status/config
ln $cur/i3status_config $home_florian/.config/i3status/config
gsettings set org.mate.session.required-components windowmanager "'i3'"
gsettings set org.mate.session required-components-list "['windowmanager']"
rm $home_florian/.vimrc
ln $cur/.vimrc $home_florian/.vimrc
# sudo $home_florian/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
rm $home_florian/.vim/.ycm_extra_conf.py
ln $cur/.ycm_extra_conf.py $home_florian/.vim/.ycm_extra_conf.py
rm $home_florian/.tmux.conf
ln $cur/.tmux.conf $home_florian/.tmux.conf
rm $home_florian/.bashrc
ln $cur/.bashrc $home_florian/.bashrc
rm $home_florian/.bash_aliases
ln $cur/.bash_aliases $home_florian/.bash_aliases
rm $home_florian/.inputrc
ln $cur/.inputrc $home_florian/.inputrc
rm $home_florian/.keymap.xkb
ln $cur/.keymap.xkb $home_florian/.keymap.xkb
echo -e '[Desktop Entry]\nName=keyboard_setup\nExec=/bin/bash -c "test -f $HOME/.keymap.xkb && xkbcomp $HOME/.keymap.xkb $DISPLAY"\nType=Application' > $home_florian/.config/autostart/keyboard_setup.desktop
xkbcomp $home_florian/.keymap.xkb $DISPLAY &> /dev/null
rm $home_florian/.gdbinit
ln $cur/.gdbinit $home_florian/.gdbinit
