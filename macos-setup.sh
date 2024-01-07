#/bin/bash

export PATH="/opt/homebrew/bin:$PATH"

if !(type "brew" > /dev/null 2>&1); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install git
brew install peco
brew install htop
brew install grep
brew install ripgrep
brew install tree
brew install tig
brew install axel
brew install ccat
brew install openssl@1.1 # for rbenv
brew install gdbm
brew install gmp
brew install libffi
brew install jemalloc
brew install mas
brew install envchain
brew install ghq
brew install direnv
brew install difftastic
brew install exa
brew install bat
brew install fd
brew install procs

brew install --cask xcodes
brew install --cask 1password
brew install --cask alfred
brew install --cask slack
brew install --cask appcleaner
brew install --cask iterm2
brew install --cask istat-menus
brew install --cask gitup
brew install --cask the-unarchiver
brew install --cask dash
brew install --cask tower
brew install --cask visual-studio-code
brew install --cask jasper
brew install --cask docker
brew install --cask alt-tab

brew tap homebrew/cask-fonts
brew install --cask font-hackgen

# quicklook
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask quicklook-json
brew install --cask qlprettypatch
brew install --cask quicklook-csv
brew install --cask provisionql
brew install --cask https://raw.githubusercontent.com/Watson1978/QLMarkdownGFM/master/qlmarkdown-gfm.rb

# Mac App Store
mas install 1575557335 # Kaleidoscope 3
mas install 1024640650 # CotEditor
mas install 419330170 # Moom
mas install 445189367 # PopClip
mas install 425955336 # Skitch
mas install 1081413713 # GIF Brewery 3
mas install 937984704 # Amphetamine
mas install 1380563956 # 辞書 by 物書堂

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
	git clone https://github.com/pine/nodenv-yarn-install.git ~/.nodenv/plugins/nodenv-yarn-install
fi

# pyenv
# if [ ! -d ~/.pyenv ]; then
# 	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
# fi

brew tap thoughtbot/formulae
brew install rcm

env RCRC=$HOME/dotfiles/rcrc rcup
