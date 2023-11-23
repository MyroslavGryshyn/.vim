#!/bin/bash
bash install_nvim.sh

# installing oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo  “Installing zsh-autosuggestions”
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo  “Installing base16-shell”
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew install the_silver_searcher

bash create_links.sh

# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# zsh-syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fuzzy search
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

echo “Installing python3”
brew install python3

echo “Installing pyenv”
brew install pyenv

echo “Installing virtualenv virtualenvwrapper”
pip3 install virtualenv virtualenvwrapper

echo “Installing node.js”
brew install node

echo “Creating neovim pyenv”
mkvirtualenv neovim
working neovim
pip3 install neovim virtualenvwrapper
deactivate
