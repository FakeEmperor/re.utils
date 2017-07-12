#!/bin/bash
set -e

# root configs
#-- whether to install vim itself or just configure it
install_vim=false
#-- installation configs
#---- src folder   
vim_folder=vim80
#---- src link
link="ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2"
# Configuration vars
vim_file=.vimrc.alt
# Plugin configs
install_plugin_ycm=true

#-- Script vars 
script_dir=$(pwd)

if [ "$install_vim" = true ] ; then
  sudo yum groupinstall 'Development tools' -y
  sudo yum install ncurses ncurses-devel wget git -y
  sudo yum install -y ruby ruby-devel lua lua-devel luajit \
    luajit-devel ctags git python python-devel \
    python3 python3-devel tcl-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed
  if [ "$install_plugin_ycm" = true ] ; then
    sudo yum install -y centos-release-scl
    sudo yum install -y devtoolset-6-gcc* cmake
    sudo scl enable devtoolset-6 bash
  fi


  cd /usr/local/src

  wget $link -nc -O vim-src.tar.bz2 || true
  rm -rf $vim_folder
  tar -xjf vim-src.tar.bz2
  
  echo "[installation] Going into extracted folder..."
  cd $vim_folder
  echo "[installation] Folder: $(pwd)"

  ./configure --with-features=huge --enable-perlinterp=dynamic --enable-rubyinterp=dynamic --enable-multibyte --enable-pythoninterp=dynamic  --with-python-config-dir="/usr/lib64/python2.7/config" --with-python3-config-dir="/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu" --enable-luainterp --with-luajit --enable-cscope --enable-gui=auto --with-x --enable-fontset  --enable-largefile --disable-netbeans --with-compiledby="@kily" --enable-fail-if-missing
  make && make install
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || true 


echo "[configuration] Going back to the script dir"
cd "${script_dir}"

echo "[configuration] Copy .vimrc to usr"
yes | cp -f "$vim_file" ~/.vimrc

vim +PluginInstall +qall 

# install YouCompleteMe
if [ "$install_plugin_ycm" = true ] ; then
    you_complete_me_plugin="${HOME}/.vim/bundle/YouCompleteMe"
    if [ -d "$you_complete_me_plugin" ]; then
       cd "$you_complete_me_plugin"
       git submodule update --recursive
       echo "[plugins] Installing YouComplete me ($(pwd))..."
       ./install.py --clang-completer
    fi
    

fi

vim --version

