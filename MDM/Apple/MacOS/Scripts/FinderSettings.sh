#!/bin/bash
#set -x

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.Terminal SecureKeyboardEntry -bool true

killall Terminal
killall Finder