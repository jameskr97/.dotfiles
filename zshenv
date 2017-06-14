# zshenv - zsh version 5.3.1
# James Roberts

# General
export DOTHOME="${HOME}/.dotfiles"
export EDITOR="/usr/bin/vim"

if [[ "$(uname)"  == "Darwin" ]]; then		# If our OS is OSX...
	export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts" 	# Set hombrew options...
fi
