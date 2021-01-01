#!/usr/bin/env bash

set -o errexit
set -o nounset
set -Eeuo pipefail

shopt -s nullglob

COMMAND=${1:-"NO_COMMAND_SPECIFIED"}
REPO=${2:-"NO_REPO_SPECIFIED"}
ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage(){
	cat<<EOF
	Usage:  $(basename "${BASH_SOURCE[0]}") [update] [init] [backup] [help] [list] [add repo] [remove plugin]

	nvimbrew.sh manage neovim plugins using default packages feature

	Available Options:

	update : Update All Plugins
	init :  Create Plugins Directory From $plugins_cache file
	list :  List installed plugins
	add repo :  Add repo to plugin directory. repo can be git url or "author/repo_name" from github
	remove plugin : remove plugin from plugin directory
	help : print help message
EOF
}

_setup() {
	plugins_cache="${XDG_CONFIG_HOME:-$HOME/.config}/darwin/plugins.txt"
	plugins_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/packages/opt"
}


_init() {
	[ -f "$plugins_cache" ] || echo 'no plugin_cache is available'

	cd "$plugins_dir"

	while IFS= read -r plugin; do
		git clone --depth=1 "$plugin"
	done <"$plugins_cache"
}

_update() {
	cd "$plugins_dir"

	for plugin in */; do
		cd "$plugin"
		git pull
		cd ".."
	done
}

_backup() {
	rm "$plugins_cache" 2>/dev/null && echo "Removing Old Cache" || echo "No Previous Plugin Cache"

	cd "$plugins_dir"

	for plugin in */; do
		cd "$plugin"
		git remote get-url origin --all >>"$plugins_cache"
		cd ".."
	done
}

_convert_to_github() {
	grep 'https://github.com/.*/.*' <<<"$REPO" || echo "https://github.com/$REPO"
}

_add() {
	cd "$plugins_dir"
	git clone --depth=1 "$(_convert_to_github)"
}

_remove() {
	cd "$plugins_dir"
	[ -d "$REPO" ] && rm -rf "$REPO" && return || echo 'directory does not exist' && echo 'starting fuzzy finder'
	plugin=$(FZF_DEFAULT_COMMAND='fd --type d --maxdepth 1' fzf)
	echo "removing $plugin"
	rm -rf "$plugin"
}

main() {
	_setup
	mkdir -p "$plugins_dir"

	case $COMMAND in
	init)
		_init
		;;
	update)
		_update
		;;
	backup)
		_backup
		;;
	add)
		[ "$REPO" = "NO_REPO_SPECIFIED" ] && echo 'please specify repo to clone' && exit 1
		_add
		;;
	remove)
		_remove
		;;
	list)
		ls -1G "$plugins_dir"
		;;
	help)
		usage
		;;
	*)
		usage
		exit 1
		;;
	esac
}

main
