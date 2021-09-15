#gruvbox colors
source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=/some/new/path:$PATH
export PATH=$HOME/.local/bin::$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="zsh-multiline/multiline"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then

# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#/home/husseljo/c_training/matrix2 $USER
#echo Hello $USER #Alternative for above compiled C program

alias ff= "fzf --preview \' bat --style=numbers --color=always --line-range :500 {}\'"
alias idea='intellij-idea-community'

alias clip='xclip -selection clipboard'

alias hostRefresh='sudo vmhgfs-fuse .hot:/ /mnt/hgfs/ -o allow_other -o uid=1000'
alias host='cd /mnt/hgfs'


#runs Cpp file
runCpp(){
	g++ -o ${1%.*} $1
	./${1%.*}
}

#runs C file
runC(){
	gcc $1 -o ${1%.*}
	./${1%.*}
}


alias compileCpp=runCpp
alias compileC=runC

alias windows='ranger /mnt/windows10/Users/hussi/OneDrive/Desktop/'
alias books='cd /mnt/windows10/Users/hussi/OneDrive/Desktop/UNIVERSITY/BOOKS'
# alias books='cd /mnt/hgfs/C/Users/hussi/OneDrive/Desktop/UNIVERSITY/BOOKS'
alias bro='git log --all --graph --decorate'

# alias yt='python3 ~/pythonTraining/youtubeSearch.py'
# alias s='python3 ~/pythonTraining/webSearch.py'
# alias packettracer='/usr/local/bin/packettracer'
# alias uniCourse='python3 ~/pythonTraining/uniOptimizations/openCourses.py'

alias vim='nvim'

LIGHT_COLOR='base16-gruvbox-light-hard.yml'
DARK_COLOR='base16-gruvbox-dark-hard.yml'

alias day="alacritty-colorscheme -V apply $LIGHT_COLOR"
alias night="alacritty-colorscheme -V apply $DARK_COLOR"
alias toggle="alacritty-colorscheme -V toggle $LIGHT_COLOR $DARK_COLOR"

alias ls='ls --color=auto --group-directories-first'
#alias ls='lsd --color=auto -group-dirs first'
alias ll='lsd -alh'

# alias cat='batcat'
alias cat='bat'

alias h='cd ~'

alias sendKindle="python3 ~/pythonTraining/mail/kindleMail.py"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/husseljo/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/home/husseljo/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/husseljo/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/home/husseljo/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<
alias jupyter="/home/husseljo/anaconda3/bin/jupyter-notebook"
alias eclipse="/home/husseljo/eclipse/java-2021-033/eclipse/eclipse"
alias python="python3"
alias py="python3"
alias downloads="cd ~/Downloads"
alias ipython='/usr/bin/ipython3'
alias ipy='/usr/bin/ipython3'

alias cms='/home/husseljo/pythonTraining/uniOptimizations/cms-downloader/main.py'
alias xmobarRestart'=xmonad --recompile; killall xmobar; xmonad --restart'
alias rustBook='firefox-developer-edition ~/rustBook/book/index.html'

zath(){
  zathura $1 & disown}

alias za=zath
# alias newplugvim="git clone $1 ~/tulu"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias postgres="sudo -i -u postgres"



# ---------------------------------------------------

# Path to your oh-my-zsh installation.
#ZSH=/usr/share/oh-my-zsh/
#
#export DEFAULT_USER="fernando"
#export TERM="xterm-256color"
#export ZSH=/usr/share/oh-my-zsh
#
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE="nerdfont-complete"
#source $ZSH/themes/powerlevel9k/powerlevel9k.zsh-theme
#
#POWERLEVEL9K_FOLDER_ICON=""
#POWERLEVEL9K_HOME_SUB_ICON="$(print_icon "HOME_ICON")"
#POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "
#
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
#
#POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
#
#POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
#POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'
#POWERLEVEL9K_NVM_BACKGROUND="238"
#POWERLEVEL9K_NVM_FOREGROUND="green"
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="blue"
#POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"
#
#POWERLEVEL9K_TIME_BACKGROUND='255'
##POWERLEVEL9K_COMMAND_TIME_FOREGROUND='gray'
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'
#
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)
#POWERLEVEL9K_SHOW_CHANGESET=true
#
#HYPHEN_INSENSITIVE="true"
#COMPLETION_WAITING_DOTS="true"
## /!\ do not use with zsh-autosuggestions
#
#plugins=(archlinux 
#	asdf 
#	bundler 
#	docker 
#	jsontools 
#	vscode 
#	web-search 
#	k 
#	tig 
#	gitfast 
#	colored-man-pages 
#	colorize 
#	command-not-found 
#	cp 
#	dirhistory 
#	autojump 
#	sudo 
#	zsh-syntax-highlighting)
## /!\ zsh-syntax-highlighting and then zsh-autosuggestions must be at the end
#
#source $ZSH/oh-my-zsh.sh
#
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#typeset -gA ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[cursor]='bold'
#
#ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'
#
#rule () {
#	print -Pn '%F{blue}'
#	local columns=$(tput cols)
#	for ((i=1; i<=columns; i++)); do
#	   printf "\u2588"
#	done
#	print -P '%f'
#}
#
#function _my_clear() {
#	echo
#	rule
#	zle clear-screen
#}
#zle -N _my_clear
#bindkey '^l' _my_clear
#
## Ctrl-O opens zsh at the current location, and on exit, cd into ranger's last location.
#ranger-cd() {
#	tempfile=$(mktemp)
#	ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
#	test -f "$tempfile" &&
#	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
#	cd -- "$(cat "$tempfile")"
#	fi
#	rm -f -- "$tempfile"
#	# hacky way of transferring over previous command and updating the screen
#	VISUAL=true zle edit-command-line
#}
#zle -N ranger-cd
#bindkey '^o' ranger-cd
#
## Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"
#
#ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
#if [[ ! -d $ZSH_CACHE_DIR ]]; then
#  mkdir $ZSH_CACHE_DIR
#fi
#
#source $ZSH/oh-my-zsh.sh
#
# ---------------------------------------------------

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# aource /usr/local/bin/virtualenvwrapper.sh
export GOPATH=/usr/lib/go
# export GOPATH=/home/user/workspace
export GOROOT=/home/husseljo/go
export PATH=$GOPATH/bin:$PATH

source "/usr/bin/virtualenvwrapper.sh"
export WORKON_HOME="~/.virtualenvs"
# source `which virtualenvwrapper.sh`
# /home/husseljo/.local/bin/virtualenvwrapper.sh
