#!/bin/bash
mkdir -p ~/.pip; cp pip.conf ~/.pip
mkdir -p ~/.vim_undodir
sudo mkdir -p ~root/.pip; sudo cp pip.conf ~root/.pip
sudo apt install -y python-pip python3-pip
sudo apt install -y clang-format clang-tidy cppman clangd-8 libclang-dev flake8
sudo apt install -y autojump ranger ncdu
sudo apt install -y vim sdcv lftp virtualbox virtualbox-guest-additions-iso
sudo apt install -y silversearcher-ag terminator
mkdir -p ~/.config/terminator; ln -sf terminator.config ~/.config/terminator/config
mkdir -p ~/.config/yapf; ln -sf yapf.ini ~/.config/yapf/style
ln -sf ~/rcfiles/coc-settings.json ~/.vim/coc-settings.json

sudo -H pip3 install cheat
sudo -H pip3 install yapf
sudo -H pip3 install pyftpdlib

echo "source ~/rcfiles/_bashrc" >> ~/.bashrc
echo "source ~/rcfiles/_vimrc" >> ~/.vimrc
echo "source ~/rcfiles/_gdbinit" >> ~/.gdbinit
cp ~/rcfiles/_gef.rc ~/.gef.rc
