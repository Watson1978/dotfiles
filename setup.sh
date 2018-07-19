#/bin/bash

brew install peco

brew tap thoughtbot/formulae
brew install rcm

env RCRC=$HOME/dotfiles/rcrc rcup

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# anyframe
git clone git@github.com:mollifier/anyframe.git ~/.zsh/anyframe

