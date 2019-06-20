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

cur=~/.dotfiles
# (manjaro)

# STAGE 1
sudo pacman -Syyu
sudo pacman -S base-devel vim
sudo pacman -S i3 dmenu xclip
reboot

# STAGE 2
cp $cur/i3_config ~/.config/i3/config
sudo pacman -S python python3
sudo pacman -S firefox
sudo pacman -S net-tools apache youtube-dl wget transmission-cli transmission-gtk qbittorrent irssi hexchat imagemagick gimp vlc subdl subdownloader mate-terminal tmux ranger caja perl-rename git cmake gdb gparted htop libreoffice-still vim-latexsuite calibre knotes clamav bc sagemath typespeed mlocate
sudo pacman -S yay
yay -S discord skypeforlinux-stable-bin slack-desktop realvnc-vnc-server realvnc-vnc-viewer hyx zulucrypt etcher cherrytree gtypist tpgt gdb-multiarch arm-linux-gnueabi-gcc aarch64-linux-gnu-gcc 
kernel linux5rt

# STAGE 2.5
# download vmware-installer from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html

# STAGE 3
chmod +x $cur/*.bundle
$cur/*.bundle
sudo pacman -S python-pip
sudo pip2 install pwntools
sudo pacman -S python-pip3
sudo pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git
$cur/binutils.sh arm
rm /tmp/binutils-build/*/config-cache
$cur/binutils.sh aarch64
rm /tmp/binutils-build/*/config-cache
$cur/binutils.sh mips
cp $cur/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
~/.vim/bundle/YouCompleteMe/install.py --clangd-completer 
cp $cur/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp $cur/.tmux.conf ~/.tmux.conf
yay -S athame-readline-git
cp $cur/.bashrc_arch ~/.bashrc
source ~/.bashrc
blackarch repo
curl -O https://blackarch.org/strap.sh
sudo ./strap.sh
sudo pacman -Syyu
sudo pacman -S blackarch
# keyboard setup
