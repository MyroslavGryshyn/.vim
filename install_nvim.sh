brew install neovim

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -s ~/.vim/.shell_prompt.sh ~/
ln -s ~/.vim/.tmux_airline_theme ~/
