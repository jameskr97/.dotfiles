# zshenv - zsh version 5.3.1
# James Roberts

# General
export DOTHOME="${HOME}/.dotfiles"
export EDITOR="/usr/bin/vim"
export WORKON_HOME=~/.virtualenvs

if [[ "$(uname)"  == "Darwin" ]]; then		# If our OS is OSX...
	export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts" 	# Set hombrew options...

	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
	source /usr/local/bin/virtualenvwrapper.sh
elif [[ -f /etc/arch-release ]]; then
	export XDG_CONFIG_HOME="$HOME/.config"

	# Python
	source /usr/bin/virtualenvwrapper.sh
fi
