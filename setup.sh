#/bin/bash

brew install peco

brew tap thoughtbot/formulae
brew install rcm

env RCRC=$HOME/dotfiles/rcrc rcup

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# anyframe
if [ ! -d ~/.zsh/anyframe ]; then
	git clone git@github.com:mollifier/anyframe.git ~/.zsh/anyframe
fi
