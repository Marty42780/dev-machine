#!/bin/bash
# Autorize root ssh connection
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# Download and install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set ZSH as default shell
chsh -s $(which zsh)

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

# Start SSH server
/usr/sbin/sshd -D &
# Start File server
http-server ~/workspace -p 44 -c-1 &

# Wait for any process to exit
wait -n
