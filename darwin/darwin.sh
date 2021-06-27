#!/usr/bin/env bash

set_macos_preferences() {
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

	defaults write -g ApplePressAndHoldEnabled -bool false
	defaults write -g InitialKeyRepeat -float 15
	defaults write -g KeyRepeat -float 1

	defaults write com.apple.dock autohide-delay -float 0
	killall Dock

	defaults write com.apple.dock autohide-time-modifier -float 0
	killall Dock

	defaults write com.apple.dock show-recents -bool FALSE
	killall Dock

	defaults write com.apple.dock tilesize -int 24
	killall Dock

	defaults write com.apple.dock autohide -int 1
	defaults write com.apple.dock orientation -string left
	killall Dock
}

generate_env_file() {
	XDG_CONFIG_HOME="/Users/saadparwaiz/Library/Preferences"
	XDG_CACHE_HOME="/Users/saadparwaiz/Library/Caches"
	XDG_DATA_HOME="/Users/saadparwaiz/Library/Share"
	XDG_STATE_HOME="/Users/saadparwaiz/Library/State"

	cp launch launch.sh

	sed -i .bak "s|\$XDG_DATA_HOME|$XDG_DATA_HOME|" launch.sh
	sed -i .bak "s|\$XDG_STATE_HOME|$XDG_STATE_HOME|" launch.sh
	sed -i .bak "s|\$XDG_CONFIG_HOME|$XDG_CONFIG_HOME|" launch.sh
	sed -i .bak "s|\$XDG_CACHE_HOME|$XDG_CACHE_HOME|" launch.sh

	[ -f launch.sh ] && rm launch.sh.bak
}

set_up_env_file() {
	DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
  [ -f ~/Library/LaunchAgents/local.enviroment.plist ] && launchctl unload ~/Library/LaunchAgents/local.enviroment.plist
	[ -f ~/Library/LaunchAgents/local.enviroment.plist ] && rm -f ~/Library/LaunchAgents/local.enviroment.plist
	ln -s "$DIR"/local.enviroment.plist ~/Library/LaunchAgents/local.enviroment.plist
	launchctl load ~/Library/LaunchAgents/local.enviroment.plist
  echo 'restart system to load all enviroment variables'
}

package_management() {
	if command -v brew &>/dev/null; then
		echo 'Homebrew is installed'
	else
		read -p "Install Homebrew?" -n 1 -r

		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			echo
			echo 'Please Install Homebrew Yourself and Run The Script Again'
			exit 1
		fi

		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi
}

install_packages() {
	brew bundle install
}

case "$1" in
install)
  install_packages
;;
homebrew)
  package_management
;;
generate)
  generate_env_file
;;
source)
  set_up_env_file
;;
pref)
  set_macos_preferences
;;
*)
  set_macos_preferences
  generate_env_file
  package_management
  install_packages
  set_up_env_file
esac
