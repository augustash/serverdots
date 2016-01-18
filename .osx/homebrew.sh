#!/usr/bin/env bash
#
# This installs some of the common dependencies desired using Homebrew.

if test ! $(which brew);
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null > /tmp/dotfiles-brew 2>&1
fi

# update repository
brew update

# taps
brew tap homebrew/php
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap gapple/services

# install updated utilities
# - GNU core utilities
# - GNU `find`, `locate`, `updatedb`, `xargs`
brew install git coreutils findutils moreutils grc spark zsh
brew install gnu-sed --with-default-names

# common packages
brew install ack
brew install bash-completion
brew install htop-osx
brew install p7zip
brew install python
brew install rbenv
brew install ruby-build
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim --env-std --override-system-vim --enable-pythoninterp  --with-ruby --with-perl
# wget with IRI support
brew install wget --with-iri

# remove outdated versions
brew cleanup

exit 0
