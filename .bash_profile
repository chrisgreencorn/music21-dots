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
alias life=~/.bash/life.sh

bind '"\C-s":"ls\n"'
bind '"\C-e":"eu ..\n"'

alias "ls"="ls -F"
alias "bc"="bc -lq ~/.bcrc"
alias "mux"="tmux attach-session -t Life"

eu() { cd "$@" && ls; }

goto() {
    path=$(find . -path ./Library -prune -o -path ./.Trash -prune -o -name $1 -print) 
    if [ -z "$path" ]; then
        echo "$1 not found."
    else 
        eu $path
    fi
}

stty -ixon

export PAGER="less"


# Disable the mission control zooming out animation.
defaults write com.apple.dock expose-animation-duration -int 0; killall Dock
# To enable again
#defaults delete com.apple.dock expose-animation-duration;killall Dock


#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#              vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#              -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#              -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
ls

