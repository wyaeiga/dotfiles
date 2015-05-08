# Path to your oh-my-zsh installation.
export ZSH=/Users/kshu/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git)


export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
[ -d "/Users/kshu/8b/bin" ] && export PATH="/Users/kshu/8b/bin:$PATH"

alias headway='cd ~/8b/brands/headway/headway/'
alias portfolio='cd ~/8b/apps/portfolio'
alias be='bundle exec'
alias powsr='powify server stop && powify server start'
alias ls='tree --dirsfirst -ChFL 1'
alias gs='echo && git status -sb && echo'