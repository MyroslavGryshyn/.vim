#!/bin/bash
bash install_nvim.sh

# installing oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

sudo apt-get install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew install the_silver_searcher

sudo add-apt-repository ppa:pgolm/the-silver-searcher
sudo apt-get update
apt-get install silversearcher-ag

bash create_links.sh
