# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/connor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
alias c='clear' 
alias R='R -q --vanilla'
alias ls='ls --color=auto'
alias wttr='curl wttr.in'
alias ranger='. ranger'
export TERM="screen-256color"

PROMPT=' %d %# '
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:/home/connor/.gem/ruby/2.6.0/bin
