#!/bin/bash

# 设置常用文件夹图标
gio set . metadata::custom-icon file://$HOME/rcfiles/icons/setting.png
mkdir $HOME/bin; gio set $HOME/bin metadata::custom-icon file://$HOME/rcfiles/icons/tools.png
mkdir $HOME/project; gio set $HOME/project metadata::custom-icon file://$HOME/rcfiles/icons/git.png
mkdir $HOME/share; gio set $HOME/share metadata::custom-icon file://$HOME/rcfiles/icons/share.png
mkdir $HOME/CTF; gio set $HOME/CTF metadata::custom-icon file://$HOME/rcfiles/icons/0x01.png
mkdir $HOME/Zotero; gio set $HOME/Zotero metadata::custom-icon file://$HOME/rcfiles/icons/zotero.png
mkdir $HOME/CalibreLibs; gio set $HOME/CalibreLibs metadata::custom-icon file://$HOME/rcfiles/icons/calibre.png
mkdir $HOME/ZimWiki; gio set $HOME/ZimWiki metadata::custom-icon file://$HOME/rcfiles/icons/zim.png
mkdir $HOME/VBoxVMs; gio set $HOME/VBoxVMs metadata::custom-icon file://$HOME/rcfiles/icons/virtualbox.png

mkdir -p $HOME/.pip; cp pip.conf $HOME/.pip
mkdir -p $HOME/.vim_undodir
sudo mkdir -p ~root/.pip; sudo cp pip.conf ~root/.pip
sudo apt install -y python-pip python3-pip
sudo apt install -y clang-format clang-tidy cppman clangd-8 libclang-dev flake8
sudo apt install -y autojump ranger ncdu
sudo apt install -y vim sdcv lftp virtualbox virtualbox-guest-additions-iso
sudo apt install -y silversearcher-ag terminator
mkdir -p $HOME/.config/terminator; ln -sf $HOME/rcfiles/terminator.config $HOME/.config/terminator/config
mkdir -p $HOME/.config/yapf; ln -sf $HOME/rcfiles/yapf.ini $HOME/.config/yapf/style
ln -sf $HOME/rcfiles/coc-settings.json $HOME/.vim/coc-settings.json

sudo -H pip3 install cheat
sudo -H pip3 install yapf
sudo -H pip3 install pyftpdlib

echo "source $HOME/rcfiles/_bashrc" >> $HOME/.bashrc
echo "source $HOME/rcfiles/_vimrc" >> $HOME/.vimrc
echo "source $HOME/rcfiles/_gdbinit" >> $HOME/.gdbinit
cp $HOME/rcfiles/_gef.rc $HOME/.gef.rc
