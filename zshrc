export PATH=$HOME/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="zsh-multiline/multiline"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ff= "fzf --preview \' bat --style=numbers --color=always --line-range :500 {}\'"
alias clip='xclip -selection clipboard'
alias vim='nvim'

alias ls='ls --color=auto --group-directories-first'
alias ll='lsd -alh'
alias cat='bat'

alias python="python3"
alias py="python3"
alias ipy='/usr/bin/ipython'

zath(){
 for file in "$@"
    do
        zathura "$file" & disown
 done
}
alias za=zath

alias vrc='nvim ~/.config/nvim/init.lua'
alias zrc='nvim ~/.zshrc'

alias r='ranger'
#Virtualenvwrapper settings:
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_VIRTUALENV=/home/husseljo/.local/bin/virtualenv
#source ~/.local/bin/virtualenvwrapper.sh
