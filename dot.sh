#!/bin/bash

cur=/home/florian/.dotfiles
home_florian=/home/florian

mkdir -p $home_florian/.config/i3
mkdir -p $home_florian/.config/i3status
ln $cur/i3_config $home_florian/.config/i3/config
ln $cur/i3status_config $home_florian/.config/i3status/config
gsettings set org.mate.session.required-components windowmanager "'i3'"
gsettings set org.mate.session required-components-list "['windowmanager']"
rm $home_florian/.vimrc
ln $cur/.vimrc $home_florian/.vimrc
sudo $home_florian/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
ln $cur/.ycm_extra_conf.py $home_florian/.vim/.ycm_extra_conf.py
rm $home_florian/.tmux.conf
ln $cur/.tmux.conf $home_florian/.tmux.conf
rm $home_florian/.bashrc
ln $cur/.bashrc_arch $home_florian/.bashrc
rm $home_florian/.bash_aliases
ln $cur/.bash_aliases $home_florian/.bash_aliases
rm $home_florian/.inputrc
ln $cur/.inputrc $home_florian/.inputrc
