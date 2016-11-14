sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install software-properties-common

sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -s ~/.vim/.shell_prompt.sh ~/
ln -s ~/.vim/.tmux_airline_theme ~/
