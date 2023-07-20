#!/bin/bash

rm ~/.tmux.conf
rm  ~/.zshrc
rm ~/.bash_aliases
rm ~/.vimrc
rm  ~/init.vim
rm ~/.agignore
rm ~/.key-binding.zsh
rm ~/.gitignore
rm ~/.tigrc


ln -s ~/.vim/init.vim  ~/init.vim
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.zshrc  ~/.zshrc
ln -s ~/.vim/.bash_aliases ~/.bash_aliases
ln -s ~/.vim/.agignore ~/.agignore
ln -s ~/.vim/.key-binding.zsh ~/.key-binding.zsh
ln -s ~/.vim/.gitignore  ~/.gitignore
ln -s ~/.vim/.tigrc  ~/.tigrc

# Installing plugins for zsh
rm -rf $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
