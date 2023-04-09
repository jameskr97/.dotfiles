# dotfiles
Managed by [chezmoi](https://www.chezmoi.io/).

## Getting started
Bootstrapping required bvefore before running `chezmoi apply`. Here are the commands I run on a newly installed debian system.

```bash
# Update system and install curl
$ sudo apt update && sudo apt upgrade
$ sudo apt install curl

# Install homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install chezmoi (at time of writing chezmoi in homebrew causes a segfault)
# Latest instructions at https://www.chezmoi.io/install/
$ curl -L https://github.com/twpayne/chezmoi/releases/download/v2.33.1/chezmoi_2.33.1_linux_amd64.deb -o chezmoi.deb
$ sudo dpkg -i chezmoi.deb

# Init and apply chezmoi
$ chezmoi init jameskr97
$ chezmoi apply # installs packages, fails after trying to access bitwarden

# Open bitwarden vault
$ bw config server bitwarden.example.com
$ bw login
$ bw unlock 

# Apply chezmoi again, successfully this time!
$ chezmoi apply
```