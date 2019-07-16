#!/bin/bash
mkdir -p ~/.pip; cp pip.conf ~/.pip
mkdir -p ~/.vim_undodir
sudo mkdir -p ~root/.pip; sudo cp pip.conf ~root/.pip
sudo apt install -y python-pip python3-pip
sudo -H pip3 install cheat
sudo -H pip3 install yapf
sudo -H pip3 install pyftpdlib

sudo apt install -y clang-format clang-tidy cppman
sudo apt install -y autojump ranger
sudo apt install -y vim sdcv lftp
sudo apt install -y silversearcher-ag terminator
ln terminator.config ~/.config/terminator/config

echo "source ~/rcfiles/_bashrc" >> ~/.bashrc
echo "source ~/rcfiles/_vimrc" >> ~/.vimrc
echo "source ~/rcfiles/_gdbinit" >> ~/.gdbinit
cp ~/rcfiles/_gef.rc ~/.gef.rc
