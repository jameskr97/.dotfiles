#!/bin/bash
# Remove symbolic links made with install.sh

log-success () { printf "  \033[2K[ \033[00;32mOK\033[0m ] $@\n"; }

unlink() {
  for src in $(find "$HOME" -type l -mindepth 1 -maxdepth 1)
  do
    rm -f $src
  done
}

unlink
log-success "All symbolic links removed"
