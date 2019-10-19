#/bin/bash

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt update
sudo apt install -y rcm

sudo apt install -y git
sudo apt install -y zsh
sudo apt install -y build-essential
sudo apt install -y libssl-dev
sudo apt install -y libyaml-dev
sudo apt install -y libreadline6-dev
sudo apt install -y zlib1g-dev
sudo apt install -y libncurses5-dev
sudo apt install -y libffi-dev
sudo apt install -y libgdbm5 libgdbm-dev

mkdir ~/bin
wget https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz
tar xf peco_linux_amd64.tar.gz
cp peco_linux_amd64/peco ~/bin

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
	git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# anyframe
if [ ! -d ~/.zsh/anyframe ]; then
	git clone --depth=1 https://github.com/mollifier/anyframe.git ~/.zsh/anyframe
fi

# rbenv
if [ ! -d ~/.rbenv ]; then
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
	git clone https://github.com/rkh/rbenv-update.git "$(rbenv root)"/plugins/rbenv-update
fi

# pyenv
if [ ! -d ~/.pyenv ]; then
	wget -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi


env RCRC=$HOME/dotfiles/rcrc rcup
