#/bin/bash

brew install git
brew install peco
brew install chisel
brew install grep
brew install the_silver_searcher
brew install tree
brew install tig
brew install ccat
brew install openssl@1.1 # for rbenv
brew install jemalloc
brew install mas

brew cask install 1password
brew cask install alfred
brew cask install slack
brew cask install appcleaner
brew cask install iterm2
brew cask install istat-menus
brew cask install gitup
brew cask install the-unarchiver
brew cask install dash
brew cask install tower
brew cask install visual-studio-code
brew cask install hyperswitch

# quicklook
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install provisionql
brew cask install https://raw.githubusercontent.com/Watson1978/QLMarkdownGFM/master/qlmarkdown-gfm.rb

# Mac App Store
mas install 587512244 # Kaleidoscope
mas install 1024640650 # CotEditor
mas install 419330170 # Moom
mas install 445189367 # PopClip
mas install 425955336 # Skitch

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

brew tap thoughtbot/formulae
brew install rcm

env RCRC=$HOME/dotfiles/rcrc rcup
