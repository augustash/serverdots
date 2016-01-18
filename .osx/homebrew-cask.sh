#!/usr/bin/env bash
#
# This installs some native OS X apps

brew tap caskroom/cask

function cask() {
    brew cask install "${@}" 2> /dev/null
}

cask alfred
cask clipmenu
cask firefox
cask google-chrome
cask iterm2
cask joinme
cask sequel-pro
cask skype
cask sublime-text3
cask superduper
cask vlc

exit 0
