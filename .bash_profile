MAILCHECK=0

export PS1='\[\e[1;31m\]\W\[\e[0m\] '

alias jc=~/.bash/car.sh
alias j=java

alias c=~/.bash/Ccar.sh

# Latex class location/usr/local/texlive/2014basic/texmf-dist/tex/latex/base/
alias latex=/usr/local/texlive/2014basic/bin/universal-darwin/pdflatex
alias tex=~/.bash/latex.sh

alias lily=~/.bash/lilypond.sh

alias o="vim"

alias "ls"="ls -F"
alias "rm"="rm -i"
eu() { cd "$@" && ls; }

stty -ixon

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
        -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
            -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
ls

