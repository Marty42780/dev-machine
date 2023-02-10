#!/bin/bash

# Download Vim Plugins
sh -c "$(curl -fsSL $plugdl)" ""

# Download zshrc and vimrc dot files from web
curl $zshrc -o /root/.zshrc
curl $vimrc -o /root/.vimrc
curl $tmuxconf -o /root/.tmux.conf

# Change git git environment variable
git config --global init.defaultBranch main
git config --global user.email ${gitemail}
git config --global user.name ${gitname}

# Start SSH server
/usr/sbin/sshd -D &

# Start File server
http-server ~/workspace -p 44 -c-1 &

# Start Wetty Server
wetty &

# Wait for any process to exit
wait -n
