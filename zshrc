# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/husseljo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="zsh-multiline/multiline"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

alias idea='intellij-idea-community'

usableTerminal(){
  # arg1=$1alias 
  nohup $1 &> /dev/null &}


usableTerminal2(){
  # arg1=$1alias 
   $1 &disown}
alias go=usableTerminal

alias clip='xclip -selection clipboard'

alias hostRefresh='sudo vmhgfs-fuse .host:/ /mnt/hgfs/ -o allow_other -o uid=1000'
alias host='cd /mnt/hgfs'
alias chrome='go google-chrome'


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

alias uni='cd /mnt/hgfs/C/Users/hussi/OneDrive/Desktop/UNIVERSITY'
alias books='cd /mnt/hgfs/C/Users/hussi/OneDrive/Desktop/UNIVERSITY/BOOKS'
#alias bro='git log --all --graph --decorate'

alias obsidian='go ~/applmages/obsidian/Obsidian-0.12.3.AppImage'

alias yt='python3 ~/pythonTraining/youtubeSearch.py'

alias packettracer='/usr/local/bin/packettracer'

alias uniCourse='python3 ~/pythonTraining/uniOptimizations/openCourses.py'
alias vim='nvim'

LIGHT_COLOR='base16-gruvbox-light-hard.yml'
DARK_COLOR='base16-gruvbox-dark-hard.yml'

alias day="alacritty-colorscheme -V apply $LIGHT_COLOR"
alias night="alacritty-colorscheme -V apply $DARK_COLOR"
alias toggle="alacritty-colorscheme -V toggle $LIGHT_COLOR $DARK_COLOR"

alias ls='ls --color=auto --group-directories-first'
#alias ls='lsd --color=auto -group-dirs first'
alias ll='lsd -alh'

alias cat='batcat'

alias h='cd ~'

alias sendKindle="python3 ~/pythonTraining/mail/kindleMail.py"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
