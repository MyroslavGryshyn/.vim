sudo apt install zsh


#!/bin/bash
bash install_nvim.sh

# installing oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo apt-get install silversearcher-ag

bash create_links.sh

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fuzzy search
sudo apt install fzf

sudo apt install thefuck

# FD install
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
