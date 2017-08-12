#!/bin/bash
bash install_nvim.sh

sudo apt-get install zsh

# installing oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew install the_silver_searcher

bash create_links.sh
