#!/bin/bash

cur=/home/florian/.dotfiles
home_florian=/home/florian

# TO DO BEFORE RUNNING THIS!
# sudo apt update && sudo apt upgrade
# git config --global user.name "florian"
# git config --global user.email flrn.pjd@protonmail.com
# ssh-keygen -t rsa -b 4096 -C "florian@parrot.local"
# ssh-add ~/.ssh/id_rsa

mkdir -p $home_florian/.config/i3
mkdir -p $home_florian/.config/i3status
rm $home_florian/.config/i3/config
ln $cur/i3_config $home_florian/.config/i3/config
rm $home_florian/.config/i3status/config
ln $cur/i3status_config $home_florian/.config/i3status/config
gsettings set org.mate.session.required-components windowmanager "'i3'"
gsettings set org.mate.session required-components-list "['windowmanager']"
gsettings set org.mate.interface gtk-decoration-layout ""
rm $home_florian/.vimrc
ln $cur/.vimrc $home_florian/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $home_florian/.vim/bundle/Vundle.vim
rm $home_florian/.tmux.conf
ln $cur/.tmux.conf $home_florian/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $home_florian/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmux-themepack.git $home_florian/.tmux-themepack
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
sudo apt remove neovim
sudo apt install tmux i3 ranger python3-dev py3status fonts-powerline rlwrap ncat vim mingw-w64 exploitdb python3-pyftpdlib markdown python-xlrd rdesktop nfs-common chromium
vim +PluginInstall +qall
sudo pip2 install pwntools
sudo pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git
git clone https://github.com/pwndbg/pwndbg $home_florian/pwndbg
cd $home_florian/pwndbg
$home_florian/pwndbg/setup.sh
sudo updatedb
sudo rm /etc/hosts
sudo ln $cur/hosts /etc/hosts
git clone https://github.com/danielmiessler/SecLists.git $home_florian/seclists
sudo mv $home_florian/seclists /usr/share/seclists
echo "Reboot now, don't forget to add your public key to blackarch's authorized_keys"
