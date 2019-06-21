#!/bin/bash

if [[ $EUID -ne 0 ]]
then
    echo "Please run as root"
    exit
fi

cur=/home/florian/.dotfiles
home_florian=/home/florian

if [[ -e $home_florian/current_stage ]]
then
    stage=$(cat $home_florian/current_stage)
else
    stage=0
fi

# STAGE 0
if [[ $stage == 0 ]]
then
    echo "git clone https://github.com/arty-hlr/.dotfiles.git"
    echo -n 1 > $home_florian/current_stage
    exit
fi

# STAGE 1
if [[ $stage == 1 ]]
then
    pacman --noconfirm -Syyu
    pacman --noconfirm -S base-devel vim
    pacman --noconfirm -S i3 dmenu xclip
    mkdir -p $home_florian/.config/i3
    sudo -u florian cp $cur/i3_config $home_florian/.config/i3/config
    echo -n 2 > $home_florian/current_stage
    echo "Reboot now"
fi

# STAGE 2
if [[ $stage == 2 ]]
then
    pacman --noconfirm -S net-tools apache youtube-dl wget transmission-cli transmission-gtk qbittorrent irssi hexchat imagemagick gimp vlc subdl subdownloader mate-terminal tmux ranger caja perl-rename git cmake gdb gparted htop vim-latexsuite calibre knotes clamav bc sagemath typespeed mlocate
    pacman --noconfirm -S yay --noconfirm
    sudo -u florian yay --noconfirm -S discord skypeforlinux-stable-bin slack-desktop realvnc-vnc-viewer hyx zulucrypt etcher cherrytree gtypist tpgt gdb-multiarch arm-linux-gnueabi-gcc aarch64-linux-gnu-gcc 
    pacman --noconfirm -Syyu
    mhwd-kernel -i linux50-rt
    echo -n 3 > $home_florian/current_stage
    echo "Reboot now"
fi

# STAGE 3
if [[ $stage == 3 ]]
then
    echo "Download vmware-installer from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html"
    echo -n 4 > $home_florian/current_stage
    exit
fi

# STAGE 4
if [[ $stage == 4 ]]
then
    # vmware
    chmod +x $home_florian/Downloads/*.bundle
    $home_florian/Downloads/*.bundle
    # pwntools
    pacman --noconfirm -S python2-pip
    pip2 install pwntools
    pacman --noconfirm -S python-pip
    pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git
    $cur/binutils.sh arm
    rm /tmp/binutils-build/*/config.cache
    $cur/binutils.sh aarch64
    rm /tmp/binutils-build/*/config.cache
    $cur/binutils.sh mips
    rm /tmp/binutils-build/*/config.cache
    # .vimrc
    sudo -u florian cp $cur/.vimrc $home_florian/.vimrc
    sudo -u florian git clone https://github.com/VundleVim/Vundle.vim.git $home_florian/.vim/bundle/Vundle.vim
    sudo -u florian vim +PluginInstall +qall
    $home_florian/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
    sudo -u florian cp $cur/.ycm_extra_conf.py $home_florian/.vim/.ycm_extra_conf.py
    # .tmux.conf
    sudo -u florian git clone https://github.com/tmux-plugins/tpm $home_florian/.tmux/plugins/tpm
    sudo -u florian git clone https://github.com/jimeh/tmux-themepack.git $home_florian/.tmux-themepack
    sudo -u florian cp $cur/.tmux.conf $home_florian/.tmux.conf
    # athame
    sudo -u florian yay -S readline-athame-git
    echo -n 5 > $home_florian/current_stage
    echo "Reboot now"
fi

# STAGE 5
if [[ $stage == 5 ]]
then
    # .bashrc
    rm $home_florian/.bashrc
    sudo -u florian cp $cur/.bashrc_arch $home_florian/.bashrc
    sudo -u florian cp $cur/.bash_aliases $home_florian/.bash_aliases
    sudo -u florian cp $cur/.inputrc $home_florian/.inputrc
    # blackarch repo
    $cur/strap.sh
    rm $cur/strap.sh
    pacman -Syyu
    # pacman -S blackarch
    sudo florian -u yay -S realvnc-vnc-server
    # keyboard setup
    echo "That's it! Just do 'source ~/.bashrc', start a new terminal, source the tmux config file, and C-b I to install tmux plugins!"
fi
