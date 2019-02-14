#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='vim'
export VISUAL='vim'
export TERMCMD='urxvt'

alias c='clear' 
alias R='R -q --vanilla'
alias ls='ls --color=auto'
alias wttr='curl wttr.in'
export TERM="screen-256color"
set -o vi

PS1=' \W >> '

