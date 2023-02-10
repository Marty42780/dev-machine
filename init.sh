#!/bin/bash

# Download Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download Vim Plugins
sh -c "$(curl -fsSL $plugdl)" ""

# Download zshrc and vimrc dot files from web
curl $zshrc -o /root/.zshrc
curl $vimrc -o /root/.vimrc

# Change git git environment variable
git config --global init.defaultBranch main
git config --global user.email ${gitemail}
git config --global user.name ${gitname}

# Set up languages
locale-gen --purge en_US.UTF-8

# Start SSH server
/usr/sbin/sshd -D &

# Start File server
http-server ~/workspace -p 44 -c-1 &

# Start Wetty Server
wetty &

# Wait for any process to exit
wait -n
