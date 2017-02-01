#!/bin/bash

# Install vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Ctags for tagbar
sudo pacman -S ctags

# Install standard formatters
sudo pacman -S clang
sudo pacman -S astyle
sudo pacman -S python python2 autopep8 python-jsbeautifier
sudo pacman -S ruby
gem install rbeautify
sudo pacman -S stylish-haskell
sudo pacman -S python-editorconfig

# Install Golang
sudo pacman -S go

# Install flake8
sudo pacman -S flake8

# Install markdown pre-viewer
sudo pacman -S nodejs npm
sudo pacman -S xdg-utils curl
sudo npm -g install instant-markdown-d

# Install scala
sudo pacman -S scala

# Install latex
sudo pacman -S latex

# Install Haskell
sudo pacman -S ghc ghc-mod
sudo pacman -S stack

# Install plugins
echo ":PluginInstall" > /tmp/tmp_vim_install
echo ":q" >> /tmp/tmp_vim_install
echo ":q" >> /tmp/tmp_vim_install
vim -s /tmp/tmp_vim_install
rm /tmp/tmp_vim_install

# Install vimproc.vim
cd ~/.vim/bundle/vimproc.vim
sudo pacman -S make
make

# Install YCM
cd ~/.vim/bundle/YouCompleteMe
sudo pacman -S automake gcc gcc-c++ cmake
./install.py --gocode-completer --tern-completer
