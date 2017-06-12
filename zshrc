# zsh version 5.3.1
# James Roberts

# Prompt
local host_name="%F{cyan}Σ%f"
local path_string="%F{yellow}%1~%f"
local prompt_string="»"
local return_status="%(?:%{$fg[blue]%}$prompt_string:%{$fg[red]%}$prompt_string)"
PROMPT="$host_name $path_string $prompt_string "

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias rmi="rm -i"

# Easily access other config files
config() {
	case $1 in
		zsh)		vim ~/.zshrc && source ~/.zshrc ;;
		zshenv)		vim ~/.zshenv && source ~/.zshenv ;;
		vim)		vim ~/.vimrc ;;
	esac	
}

# Colorful commands
alias ls="ls -FG"
alias l="ls -lFh"
alias la="ls -lAFh"
alias ll="ls -l"
alias grep="grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
