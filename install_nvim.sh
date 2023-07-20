sudo apt  install neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -s ~/.vim/.shell_prompt.sh ~/
ln -s ~/.vim/.tmux_airline_theme ~/

sudo apt install ruby-dev
sudo apt install npm
sudo gem install neovim
sudo npm install -g neovim
