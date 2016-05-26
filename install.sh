#!/usr/bin/bash
# Installing brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

bash install_nvim.sh

# installing oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew install fzf
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

bash create_links.sh
cp karabiner/private.xml /Users/mhrysh/Library/Application\ Support/Karabiner/
