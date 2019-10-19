#/bin/bash

mkdir ~/bin
wget https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz
tar xf peco_linux_amd64.tar.gz
cp peco_linux_amd64/peco ~/bin

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
	git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git
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
	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm

env RCRC=$HOME/dotfiles/rcrc rcup
