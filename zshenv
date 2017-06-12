# zshenv - zsh version 5.3.1
# James Roberts

local os_name="$(uname)"

if [[ $os_name == "Darwin" ]]; then		# If our OS is OSX...
	export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts" 	# Set hombrew options...
fi
