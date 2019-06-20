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
    mkdir -p ~/.config/i3
    cp $cur/i3_config ~/.config/i3/config
    sudo reboot now
fi

# STAGE 2
if [[ $stage == 2 ]]
then
    sudo pacman -S python python3
    echo "Next?"; read ok
    sudo pacman -S firefox
    echo "Next?"; read ok
    sudo pacman -S net-tools apache youtube-dl wget transmission-cli transmission-gtk qbittorrent irssi hexchat imagemagick gimp vlc subdl subdownloader mate-terminal tmux ranger caja perl-rename git cmake gdb gparted htop libreoffice-still vim-latexsuite calibre knotes clamav bc sagemath typespeed mlocate
    echo "Next?"; read ok
    sudo pacman -S yay
    echo "Next?"; read ok
    yay -S discord skypeforlinux-stable-bin slack-desktop realvnc-vnc-server realvnc-vnc-viewer hyx zulucrypt etcher cherrytree gtypist tpgt gdb-multiarch arm-linux-gnueabi-gcc aarch64-linux-gnu-gcc 
    echo "Next?"; read ok
    sudo mhwd-kernel -i linux5rt
    echo "Installed kernels:"
    mhwd-kernel -li
    echo "Reboot now"
fi

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
    sudo $cur/*.bundle
    echo "Next?"; read ok
    # pwntools
    sudo pacman -S python-pip
    echo "Next?"; read ok
    sudo pip2 install pwntools
    echo "Next?"; read ok
    sudo pacman -S python-pip3
    echo "Next?"; read ok
    sudo pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git
    echo "Next?"; read ok
    $cur/binutils.sh arm
    echo "Next?"; read ok
    rm /tmp/binutils-build/*/config-cache
    $cur/binutils.sh aarch64
    echo "Next?"; read ok
    rm /tmp/binutils-build/*/config-cache
    $cur/binutils.sh mips
    echo "Next?"; read ok
    # .vimrc
    cp $cur/.vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    echo "Next?"; read ok
    ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
    echo "Next?"; read ok
    cp $cur/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
    # .tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    cp $cur/.tmux.conf ~/.tmux.conf
    # athame
    yay -S athame-readline-git
    echo "Reboot now"
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
