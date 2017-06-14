# .dotfiles

My system configuration files. Made for macOS.

# What does this do

If you are using a macOS/OSX system, running `install.sh` will:
  1. Create folder ~/Applications (For cask apps - check zshenv)
  2. Run xcode-select to get command line tools
  3. Install Homebrew and homebrew cask.
  4. Install cask apps

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
