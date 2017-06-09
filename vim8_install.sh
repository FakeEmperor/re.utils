#!/bin/bash

yum groupinstall 'Development tools' -y
yum install ncurses ncurses-devel wget git -y
cd /usr/local/src
wget ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2
tar -xjf vim-7.4.tar.bz2
cd vim74
./configure --prefix=/usr --with-features=huge --enable-rubyinterp --enable-pythoninterp
make && make install

vim --version

cd ~ && git clone https://github.com/holguinj/vimrc.git --recurse-submodules
mv vimrc .vim
ln -s vimrc ~/.vimrc
