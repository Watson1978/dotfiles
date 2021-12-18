#/bin/bash

wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install -y rcm

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
sudo apt install -y libssl-dev zlib1g-dev
sudo apt install -y peco

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
	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
fi

# nodenv
if [ ! -d ~/.nodenv ]; then
	git clone https://github.com/nodenv/nodenv.git ~/.nodenv
	git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
	git clone https://github.com/nodenv/nodenv-update.git ~/.nodenv/plugins/nodenv-update
fi


# pyenv
# if [ ! -d ~/.pyenv ]; then
# 	wget -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
# fi


env RCRC=$HOME/dotfiles/rcrc rcup
