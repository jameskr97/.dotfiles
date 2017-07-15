#!/bin/bash
# James' UNIX System Setup

# Why this script asks for sudo:
# - To change your shell
# - To install Homebrew (Mac)

# Setup Variables
LINKDIR=$HOME # Not sure if this and the next line are the best way of doing this
DOTDIR="$LINKDIR/.dotfiles" # but I'll go with it for now

# Helper functions
info () { printf "\r  [ \033[00;34m..\033[0m ] $1\n"; } # [ .. ] $1
user () { printf "\r  [ \033[0;33m??\033[0m ] $1\n"; } # [ ?? ] $1
alert () { printf "\r  [ \033[0;91m!!\033[0m ] $1\n"; } # [ !! ] $1
success () { printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"; } # [ OK ] $1
fail () { printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"; exit; } # [FAIL] $1

# Environment Setup
# First argument is the folder with things inside to link to home directory
install_dotfiles_stow() {
	if [ ! $1 ]; then fail "install_dotfiles_stow: invalid params"; fi
	initial_dir=$(pwd); cd $1
	for file_to_link in $(find . -maxdepth 1 -mindepth 1); do
		base_file=$(basename $file_to_link)
		stow -t $HOME $base_file
	done
	cd $initial_dir # Return to previous directory
}

# OSX Setup Functions
install_homebrew() {
	# Install brew itself
	if [[ "$(which brew)" == "1" ]]; then
		info "Installing Homebrew..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		info "Homebrew already installed. Updating..."
		brew update &> /dev/null
	fi

	# Install homebrew cask
	if [[ "$(brew tap)" == *"caskroom/cask"* ]]; then
		info "Homebrew cask already installed. Skipping..."
	else
		info "Installing Homebrew Cask..."
		brew tap caskroom/cask
	fi
	success "Homebrew installation complete!"
}

install_osx_term() {
	info "Installing command line apps..."
	local APPS=("stow" "dtrx" "wget" "tree" "python3" "tmate" "irssi" "nmap")
	for app in ${APPS[@]}; do
		info "Installing $app..."; brew install "$app" &>/dev/null
	done
	success "Installed brew apps Applications!"
	exit
}

install_mac_apps() {
	info "Installing Cask application..."
	local APPS=("google-chrome" "discord" "iterm2" "transmission" "skype" "steam" "ubersicht")

	for app in ${APPS[@]}; do
		info "Installing $app..."; brew cask install "$app" &>/dev/null
	done

	success "Installed Brew Cask Applications!"
	exit
}

# ArchLinux Specific
install_pacman() {
	if [[ -z $(pacman -Qs $1) ]]; then
		info "Installing $1..."
		sudo pacman --noconfirm --needed -S $1 &>/dev/null
	else
		alert "$1 already installed. Skipping..."
	fi
}

install_pacaur(){
	if [[ -z $(pacman -Qs $1) ]]; then
		info "Installing $1 via pacaur..."
		pacaur --noconfirm --needed --noedit -S $1 &>/dev/null
	else
		alert "$1 already installed. Skipping..."
	fi
}

install_aur_git () {
	if [[ -z $(pacman -Qs $1) ]]; then
		info "Installing $1..."
		git clone --quiet https://aur.archlinux.org/$1.git
		cd $1
		makepkg --skippgpcheck --install --needed --noconfirm &>/dev/null
	else
		alert "$1 already installed. Skipping..."
	fi
}

install_aur_helper() {
	local work_dir="$(mktemp -d)"
	cd $work_dir
	info "Installing Pacaur..."
	info "Using working directory $work_dir..."
	info "Installing pacaur dependencies..."
	install_pacman expac
	install_pacman yajl
	install_pacman git
	install_aur_git cower; cd $work_dir
	install_aur_git pacaur;

	info "Deleting working directory..."
	rm -rf $work_dir
	success "Installed AUR Helper!"
}

install_system_desired(){
	info "Installing drivers..."
	install_pacman nvidia

	info "Installing X11 Display server..."
	install_pacman xorg-server
	install_pacman xorg-xinit
	install_pacman xorg-xrandr
	install_pacman feh # Not apart of the server... but best category
	success "Installed X11 Display Server!"

	# Note on fonts: To see the system font name, use fc-list
	info "Installing fonts..."
	install_pacman ttf-hack
	install_pacman ttf-inconsolata
	install_pacman adobe-source-code-pro-fonts
	install_pacaur otf-san-francisco
	success "Installed fonts!"

	info "Installing arch specific programs..."
	install_pacman zsh
	install_pacman rxvt-unicode
	install_pacman vim
	install_pacaur bspwm-git
	install_pacaur sxhkd-git
	install_pacaur neofetch
	# Check users shell
	if [[ "$SHELL" != $(which zsh) ]]; then
		info "Changing shell to zsh..."
		chsh -s $(which zsh)
	fi
}

# Linking dotfililes
info "Linking universal dotfiles..."
install_dotfiles_stow dot_uni

# OS Spexific actions
if [[ "$(uname)" == "Darwin" ]]; then # If we're using OSX/macOS
	# Add Darwin specific dotifles
	info "Linking Darwin dotfiles..."
	install_dotfiles_stow dot_macos
	exit # Temporary
	# Create Applications folder in home
	mkdir -p ~/Applications

	# TODO: Check if XcodeCLT  is already installed
	# Install Xcode Command line tools
	info "Installing command line tools..."
	xcode-select --install &> /dev/null

	install_homebrew
	install_mac_apps

elif [[ -f /etc/arch-release ]]; then # If we're using ArchLinux
	info "Updating arch system..."
	sudo pacman -Syu --noconfirm &>/dev/null

	info "Linking Arch dotfiles..."
	install_dotfiles_stow dot_arch
		
	install_aur_helper
	install_system_desired
fi
