# .dotfiles

My system configuration files. Made for macOS, ArchLinux and Ubuntu/Debian.

# What does this do

When running `install.sh`, the script will do the following...
- All of them
	1. Link files in dot_uni to the home folder

- macOS
	1. Create folder ~/Applications (For cask apps - check zshenv)
	2. Run xcode-select to get command line tools
	3. Install Homebrew and homebrew cask.
	4. Install cask apps

- Arch
	1. Link Arch specific dotfiles
	2. Install pacaur and dependencies
	3. Install X11 Display server

- Ubuntu/Debian
	1. Nothing as of yet...

`install.sh` requires root privileges to make installation seamless.

# Install
```bash
$ cd ~
$ git clone https://github.com/Jameskr97/.dotfiles.git ~/.dotfiles

$ cd .dotfiles
$ chmod a+x install.sh
$ ./install.sh
```

# Thanks
Thanks [zharoz](https://github.com/zhaorz). I liked [your .dotfiles](https://github.com/zhaorz/.dotfiles) repo. We're friends now.
