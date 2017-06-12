#!/bin/bash
# James' UNIX System Setup

# Why this script asks for sudo:
# - To change your shell
# - To install Homebrew (Mac)

# Setup Variables
LINKDIR=$HOME
DOTDIR=$(pwd)
EXIST_DOT_BACKUP="$LINKDIR/.jsetup_backups"
BACKUP_ALL=false
SKIP_ALL=false

# Helper functions
info () { printf "\r  [ \033[00;34m..\033[0m ] $1\n"; } 						# [ .. ] $1
user () { printf "\r  [ \033[0;33m??\033[0m ] $1\n"; } 							# [ ?? ] $1
alert () { printf "\r  [ \033[0;91m!!\033[0m ] $1\n"; } 						# [ !! ] $1
success () { printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"; } 				# [ OK ] $1
fail () { printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"; exit; } 	# [FAIL] #MSG

# Environment Setup
install_dotfiles() {
	# $0 to ignore this running file
	local IGNORE=("install.sh" ".git" ".gitignore" ".gitmodules" "README.md" ".DS_Store")

	for file_abs in $(find $DOTDIR -mindepth 1 -maxdepth 1 | sort) # For every file in $DOTDIR
	do
		file=$(basename $file_abs)
		if [[ "${IGNORE[@]}" =~ "$file" ]]; then continue; fi # Continue if it's being ignored
		dotlink="$LINKDIR/.$file" # Create intended file link location

		if [[ -e $dotlink ]]; then # Check if file/folder already exists
			# Here, we check if $dotlink is a symbolic file, and if the link location is the same as a file in our $DOTDIR directory.
			# If all is true, the continue, because it's already linked.
			if [[ -L $dotlink && "$(readlink $dotlink)" == "$DOTDIR/$file" ]]; then info "$file already linked..."; continue; fi

			if [[ "$SKIP_ALL" == true ]]; then alert "Skipping $file"; continue; fi 	# Uphold skip all
			if [[ "$BACKUP_ALL" == false ]]; then										# Skip query and go straight to backup
	 			user "$(basename $dotlink) already exists in $LINKDIR. [B]ackup, Backup [a]ll (to $(basename $EXIST_DOT_BACKUP), [s]kip, or ski[p] all?"
				read -n 1 action 																		# Take action.
				if [[ $action == "a" ]]; then BACKUP_ALL=true; fi 										# Activate the backup all
				if [[ $action == "p" ]]; then SKIP_ALL=true; fi 										# Activate the skip all
				if [[ $action == "s" || $action == "p" ]]; then alert "Skipping $file"; continue; fi 	# Make/use backup and continue
			fi
			mkdir -p $EXIST_DOT_BACKUP 													# Ensure backup dir exists...
			mv "$dotlink" "$EXIST_DOT_BACKUP/.${file}_$(date +%Y-%m-%d:%H:%M:%S)"		# Move $dotlink to backup dir...
			success "Original $(basename $dotlink) backed-up!"							# Logging to user
		fi
		ln -s "$file_abs" "$dotlink" 	# Link the files!
		success "$file linked!" 		# Alert of link
	done
}

# OSX Setup Functions
install_homebrew() {
	if [[ "$(which brew)" == "1" ]]; then
		info "Installing Homebrew..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		info "Homebrew already installed. Updating..."
		brew update &> /dev/null
	fi
	#TODO: Is this necessary?
	if [[ "$(brew tap)" == *"caskroom/cask"* ]]; then
		info "Homebrew cask already installed. Skipping..."
	else
		info "Installing Homebrew Cask..."
		brew tap caskroom/cask
	fi
	success "Homebrew installation complete!"
}
install_mac_apps() {
	info "Installing Cask application..."
	local APPS=("google-chrome" "discord" "iterm2" "transmission" "skype"\
	"steam" "ubersicht")

	for app in ${APPS[@]}; do
		info "Installing $app..."; brew cask install "$app" &>/dev/null
	done

	success "Installed Brew Cask Applications!"
	exit
}

# Download packages
if [[ "$(uname)" == "Darwin" ]]; then 		# If we're using OSX/macOS
	# Create Applications folder in home
	mkdir -p ~/Applications

	# Install Xcode Command line tools
	#info "Installing command line tools..."
	#xcode-select --install &> /dev/null

	install_homebrew
	install_mac_apps

elif [[ -f /etc/arch-release ]]; then		# If we're using ArchLinux
fi
