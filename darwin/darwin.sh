#!/bin/bash

# macOS Preferences
defaults write com.apple.screencapture type JPG
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSWindowResizeTime -float 0.001
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write -g NSToolbarFullScreenAnimationDuration -float 0.001
defaults write com.apple.CrashReporter UseUNC 1
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Hide MenuBar
defaults write -g _HIHideMenuBar -int 1
killall -KILL SystemUIServer

# Key Repeat
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -float 15
defaults write -g KeyRepeat -float 1

# Dock Delay
defaults write com.apple.dock autohide-delay -float 0
killall Dock

defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

defaults write com.apple.dock show-recents -bool FALSE
killall Dock


# Dock Size
defaults write com.apple.dock tilesize -int 24
killall Dock

# Dock Position
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock orientation -string left
killall Dock

if command -v brew &> /dev/null; then
    echo 'Homebrew is installed'
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew bundle install
ln -s $(pwd)/local.enviroment.plist ~/Library/LaunchAgents/local.enviroment.plist
launchctl load ~/Library/LaunchAgents/local.enviroment.plist
