#!/bin/bash

rm ~/.tmux.conf
rm  ~/.zshrc
rm ~/.bash_aliases
rm ~/.vimrc
rm  ~/init.vim
rm ~/.agignore
rm ~/.key-binding.zsh


ln -s ~/.vim/init.vim  ~/init.vim
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.zshrc  ~/.zshrc
ln -s ~/.vim/.bash_aliases ~/.bash_aliases
ln -s ~/.vim/.agignore ~/.agignore
ln -s ~/.vim/.key-binding.zsh ~/.key-binding.zsh
