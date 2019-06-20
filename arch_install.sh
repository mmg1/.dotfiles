#!/bin/bash

stage=$1
cur=~/.dotfiles

# Basic install (encryption?)
# add user florian (-m -g users -G sudo -p password)
# vim
# sudo/visudo
# nvidia
# reboot

# dns,ens33.network,systemd-networkd
# xterm termite vim
# xorg xorg-server xorg-xinit
# gnome gnome-extra, gdm enable/start
# ||
# kde, kdm enable/start

# STAGE 1
if [[ $stage == 1 ]]
then
    sudo pacman -Syyu
    sudo pacman -S base-devel vim
    sudo pacman -S i3 dmenu xclip
    sudo reboot now
fi

# STAGE 2
if [[ $stage == 2 ]]
then
    mkdir -p ~/.config/i3
    cp $cur/i3_config ~/.config/i3/config
    sudo pacman -S python python3
    sudo pacman -S firefox
    sudo pacman -S net-tools apache youtube-dl wget transmission-cli transmission-gtk qbittorrent irssi hexchat imagemagick gimp vlc subdl subdownloader mate-terminal tmux ranger caja perl-rename git cmake gdb gparted htop libreoffice-still vim-latexsuite calibre knotes clamav bc sagemath typespeed mlocate
    sudo pacman -S yay
    yay -S discord skypeforlinux-stable-bin slack-desktop realvnc-vnc-server realvnc-vnc-viewer hyx zulucrypt etcher cherrytree gtypist tpgt gdb-multiarch arm-linux-gnueabi-gcc aarch64-linux-gnu-gcc 
    sudo mhwd-kernel -i linux5rt
    echo "After reboot, download vmware-installer from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html"
    sudo reboot now
fi

# STAGE 2.5

# STAGE 3
if [[ $stage == 3 ]]
then
    echo "Did you download vmware? (y/n)"
    read res
    if [[ $res = n ]]
    then
        echo "Download vmware-installer from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html"
        exit
    fi
    # vmware
    chmod +x $cur/*.bundle
    $cur/*.bundle
    # pwntools
    sudo pacman -S python-pip
    sudo pip2 install pwntools
    sudo pacman -S python-pip3
    sudo pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git
    $cur/binutils.sh arm
    rm /tmp/binutils-build/*/config-cache
    $cur/binutils.sh aarch64
    rm /tmp/binutils-build/*/config-cache
    $cur/binutils.sh mips
    # .vimrc
    cp $cur/.vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
    cp $cur/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
    # .tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    cp $cur/.tmux.conf ~/.tmux.conf
    # athame
    yay -S athame-readline-git
    sudo reboot now
fi

# STAGE 4
if [[ $stage == 4 ]]
then
    # .bashrc
    rm ~/.bashrc
    cp $cur/.bashrc_arch ~/.bashrc
    cp $cur/.bashaliases ~/.bashaliases
    source ~/.bashrc
    # blackarch repo
    curl -O https://blackarch.org/strap.sh
    sudo ./strap.sh
    sudo pacman -Syyu
    sudo pacman -S blackarch
    # keyboard setup
fi
