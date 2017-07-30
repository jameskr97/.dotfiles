# .dotfiles

My system configuration files. Made for macOS and  ArchLinux.

# What does this do

When running `install.sh`, the script will do the following...
- All of them
	* Link dot_uni to home folder with git stow

- macOS
	* Create folder ~/Applications (For cask apps - check zshenv)
	* Run xcode-select to get command line tools
	* Install Homebrew and homebrew cask apps
	* Install macOS specific dotfiles

- Arch
	* Install pacaur and dependencies
	* Install X11 Display server
	* Install the various applications I want
	* Link Arch specific dotfiles

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
