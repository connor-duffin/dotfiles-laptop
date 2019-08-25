set -o vi
alias ls='ls --color=auto'
alias my_scrot='scrot ~/Pictures/%Y-%m-%d-%H%M%s.png'
alias R='R --quiet --no-save' 
alias wttr='curl wttr.in'
export VISUAL='vim'
export TERM="rxvt-unicode-256color"

PS1=' \W >> '
export PATH=$PATH:/home/connor/.local/bin:/home/connor/.gem/ruby/2.6.0/bin:/home/connor/.scripts

HISTSIZE=-1

ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}
