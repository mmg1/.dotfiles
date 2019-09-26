#!/bin/bash

cur=/home/florian/.dotfiles
home_florian=/home/florian

if [[ -e $home_florian/current_stage ]]
then
    stage=$(cat $home_florian/current_stage)
    if [[ $EUID -ne 0 ]]
    then
        echo "Please run as root"
        exit
    fi
else
    stage=0
fi

# STAGE 0
if [[ $stage == 0 ]]
then
    gsettings set org.mate.peripherals-touchpad natural-scroll true
    gsettings set org.mate.peripherals-touchpad tap-to-click true
    gsettings set org.mate.peripherals-touchpad vertical-edge-scrolling true
    gsettings set org.mate.peripherals-touchpad vertical-two-finger-scrolling true
    gsettings set org.mate.peripherals-touchpad horizontal-edge-scrolling false
    gsettings set org.mate.peripherals-touchpad horizontal-two-finger-scrolling true
    ln $cur/.keymap.xkb $home_florian/.keymap.xkb
    echo -e '[Desktop Entry]\nName=keyboard_setup\nExec=/bin/bash -c "test -f $HOME/.keymap.xkb && xkbcomp $HOME/.keymap.xkb $DISPLAY"\nType=Application' > $home_florian/.config/autostart/keyboard_setup.desktop
    xkbcomp $home_florian/.keymap.xkb $DISPLAY &> /dev/null
    mkdir -p $home_florian/.config/i3
    mkdir -p $home_florian/.config/i3status
    ln $cur/i3_config $home_florian/.config/i3/config
    ln $cur/i3status_config $home_florian/.config/i3status/config
    gsettings set org.mate.session.required-components windowmanager "'i3'"
    gsettings set org.mate.session required-components-list "['windowmanager']"
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
    echo -n 2 > $home_florian/current_stage
    echo "Reboot now"
fi

# STAGE 2
if [[ $stage == 2 ]]
then
    pacman --noconfirm -S gnu-netcat net-tools apache youtube-dl wget transmission-cli transmission-gtk qbittorrent irssi hexchat imagemagick gimp mpv subdl subdownloader mate-terminal tmux ranger caja perl-rename git cmake gdb gparted htop vim-latexsuite calibre knotes clamav bc sagemath typespeed mlocate
    pacman --noconfirm -S yay
    sudo -u florian yay -S spotify discord skypeforlinux-stable-bin slack-desktop realvnc-vnc-viewer realvnc-vnc-server pwndbg peda hyx zulucrypt cherrytree gtypist tpgt gdb-multiarch arm-linux-gnueabi-gcc aarch64-linux-gnu-gcc fluxgui py3status etcher
    sudo -u florian ln -s $cur/i3lock_once /usr/bin/i3lock_once
    cp $cur/i3lock_once.service /etc/systemd/system/i3lock_once.service
    systemctl enable i3lock.service
    pacman --noconfirm -Syyu
    mhwd-kernel -i linux50-rt
    pacman --noconfirm -S linux50-rt-headers
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
    sudo -u florian ln $cur/.vimrc $home_florian/.vimrc
    sudo -u florian git clone https://github.com/VundleVim/Vundle.vim.git $home_florian/.vim/bundle/Vundle.vim
    sudo -u florian vim +PluginInstall +qall
    $home_florian/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
    sudo -u florian ln $cur/.ycm_extra_conf.py $home_florian/.vim/.ycm_extra_conf.py
    # .tmux.conf
    sudo -u florian git clone https://github.com/tmux-plugins/tpm $home_florian/.tmux/plugins/tpm
    sudo -u florian git clone https://github.com/jimeh/tmux-themepack.git $home_florian/.tmux-themepack
    sudo -u florian ln $cur/.tmux.conf $home_florian/.tmux.conf
    systemctl enable fstrim.timer
    echo -n 5 > $home_florian/current_stage
    echo "Reboot now"
fi

# STAGE 5
if [[ $stage == 5 ]]
then
    # .bashrc
    rm $home_florian/.bashrc
    sudo -u florian ln $cur/.bashrc_arch $home_florian/.bashrc
    sudo -u florian ln $cur/.bash_aliases $home_florian/.bash_aliases
    sudo -u florian ln $cur/.inputrc $home_florian/.inputrc
    # blackarch repo
    $cur/strap.sh
    pacman -Syyu
    pacman -S blackarch
    sudo -u florian yay -S realvnc-vnc-server
    sudo -u florian mkdir -p $home_florian/.config/mpv
    sudo -u florian ln $cur/mpv.conf $home_florian/.config/mpv/mpv.conf
    sudo -u florian ln $cur/.gdbinit $home_florian/.gdbinit
    ln -s $cur/peda /usr/bin/peda
    ln -s $cur/pwndbg /usr/bin/pwndbg
    echo "That's it! Just do 'source ~/.bashrc', start a new terminal, source the tmux config file, and C-b I to install tmux plugins!"
    rm $home_florian/current_stage
fi

# sudo vmware-modconfig --console --install-all
