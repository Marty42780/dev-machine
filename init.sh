#!/bin/bash

# Autorize root ssh connection
echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config

# Download and install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download vim Plugins
sh -c "$(curl -fsSL $plugdl)" ""

# Download zshrc and vimrc dot files from web
curl $zshrc -o /root/.zshrc
curl $vimrc -o /root/.vimrc

# Change default git branch from master to main
git config --global init.defaultBranch main

# Start SSH server
/usr/sbin/sshd -D &
# Start File server
http-server ~/workspace -p 44000 -c-1 &

# Wait for any process to exit
wait -n


