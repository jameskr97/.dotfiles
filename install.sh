#!/bin/bash
# James' UNIX System Setup

# Setup Variables
DOTDIR="$HOME/.dotfiles"
DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/dots && pwd )"


# Helper functions
log-info () { printf "  [ \033[00;34m..\033[0m ] $@\n"; } # [ .. ] $1@
log-question () { printf "  [ \033[0;33m??\033[0m ] $@\n"; } # [ ?? ] $@
log-alert () { printf "  [ \033[0;91m!!\033[0m ] $@\n"; } # [ !! ] $@
log-success () { printf "  \033[2K[ \033[00;32mOK\033[0m ] $@\n"; } # [ OK ] $@
log-fail () { printf "  \033[2K[\033[0;31mFAIL\033[0m] $@\n"; exit; } # [FAIL] $@

# zhaorz modified link_file method. I added some comments.
link_file () {
	if [ ! $# -eq 2 ]; then
		log-fail "link_file: Insufficient parameters."
	fi

    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    # If $dst exists as file, folder, or symbolic link
    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then

    	# If we haven't already asked to overwrite, back, or skip all existing links
        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then

        	# Get where the link currently leads
            local currentSrc="$(readlink $dst)"

            # IF currentSource and $src are the same, then leave this repo
            if [ "$currentSrc" == "$src" ]; then
                skip=true;
            else
            	# Tell user file already exists, and ask what to do with it.
                log-question "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
    	[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

                read -n 1 action

                case "$action" in
                    o) overwrite=true;;
                    O) overwrite_all=true;;
                    b) backup=true;;
                    B) backup_all=true;;
                    s) skip=true;;
                    S) skip_all=true;;
                    *) ;;
                esac

            fi

        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]; then
            rm -rf "$dst"
            log-success "removed $dst"
        fi

        if [ "$backup" == "true" ]; then
            mv "$dst" "${dst}.backup"
            log-success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]; then
            log-success "skipped $src"
        fi
    fi

    # If not told to skip then do the symbolic link
    if [ "$skip" != "true" ]; then  # "false" or empty
        ln -s "$1" "$2"
        log-success "linked $1 to $2"
    fi
}

install_dotfiles () {
    log-info 'installing dotfiles'

    local overwrite_all=false backup_all=false skip_all=false

    # Install all the files only
    for src in $(find "$DOTFILES_ROOT" -mindepth 1 -maxdepth 1)
    do
		dst="$HOME/.$(basename "$src")"
		link_file "$src" "$dst"
    done
}


if [[ "$(uname)" == "Darwin" ]]; then
	install_dotfiles
fi