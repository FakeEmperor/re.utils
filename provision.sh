#!/bin/bash
# Provisions .vimrc, .tmux.conf and scripts (if any) to home dir
set -e

BLUE="\e[36m"
GREEN="\e[32m"
BOLD="\e[1m"
RESET="\e[0m"


user="FakeEmperor"
utilsRepo="https://github.com/${user}/re.utils"
path="$HOME/${user}_utils"
installPlugins=1

echoSkipped() {
  echo -e "${BLUE}${BOLD}Skipped!${RESET}"  

}
echoDone() {
  echo -e "${GREEN}${BOLD}Done!${RESET}"  

}

echo -en "${GREEN}[+] Cloning repo... ${RESET}"
set +e
git clone "$utilsRepo" "$path"
if [[ "$?" -eq 128 ]]; then 
  echoSkipped
elif [[ "$?" -ne 0 ]]; then
  exit "$?"
else 
  echoDone
fi
set -e

cd "$path"
echo -en "${GREEN}[+] Copying configs... ${RESET}"
cp .vimrc ~/ || true
cp .bashrc ~/ || true
cp .tmux*.conf ~/ || true
echoDone

echo -en "${GREEN}[+] Installing VIM plugins... ${RESET}"
# install vim plugins
if [[ installPlugins -eq 1 ]]; then
  echo -en "${GREEN}[+] Installing Vundle... ${RESET}"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  echoDone
else
  echoSkipped
fi

