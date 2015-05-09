let $PAGER=''

syntax on
set relativenumber
set showcmd
set smartindent 
set backspace=start,eol,indent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set ru
set breakindent
set wrap
set noswapfile
set ignorecase
set spelllang=en
set shellcmdflag=-ic

let mapleader = "\<Space>"
noremap <Space> <NOP>
noremap t gj
noremap n gk
noremap s l
noremap T }
noremap N {
"noremap H 10h
"noremap S 10l
noremap H b
noremap S w

noremap k n
noremap K N
noremap l t
noremap L T
nnoremap ; :
nnoremap cc ^C
nnoremap , i_<Esc>r

nnoremap <CR> o<Esc>
nnoremap <BS> dd
nnoremap == vip=

" Make Space and o/O keep indentation.
inoremap <CR> <CR><Space><BS>
nnoremap o o<Space><BS>
nnoremap O O<Space><BS>

nnoremap <C-z> 1z=
inoremap <C-z> <Esc>[sz=1<CR><CR>A

hi Comment ctermfg=88
hi MatchParen ctermfg=208 ctermbg=233 cterm=bold

" easy access to beginning and end of line
noremap - $
noremap _ 0

inoremap <c-s> <C-g>u<Esc>:update<Enter>a

inoremap <Tab> <Esc>>>A
inoremap <S-Tab> <Esc><<A

inoremap <c-e> <Esc>:update<CR>
nnoremap <c-s> :update<CR>

" Leader to quit
nnoremap <Leader>q :q!<CR>
" comment out the line
nnoremap <Leader>7 ^i//<Esc>
" Leader jm to make the java Main method
nnoremap <Leader>jm ipublic static void main(String[] args) {<CR>}<Esc>gg=Gjo<Space><BS>

autocmd BufEnter *.nts call Notes()
autocmd BufEnter *.java call Match()
autocmd BufEnter *.java call Java()
autocmd BufEnter,BufNewFile,BufReadPost *.tex call Tex()
autocmd BufEnter *.c call Match()
autocmd BufEnter *.*rc set syntax=vim

autocmd BufNewFile *.java 
\ exe "normal ipublic class " . expand('%:t:r') . " {\n}\<Esc>O"

au BufReadPost,BufNewFile,BufEnter *.java colo monokai
au BufReadPost *.c colorscheme monokai

function Tex()
    inoremap <silent> <Tab> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
    inoremap " ``"<Left>
    call Spell()
    command! Latex execute "silent !pdflatex % > ./errors.txt && evince %:r.pdf > /dev/null 2>&1 &" | redraw!
    map <C-l> :Latex<CR>
endfunction

function Essay()
    0r ~/.vim/Template.tex
    norm /Type<Enter>o
endfunction

function Notes() 
    inoremap <Enter> <Esc>:update<CR>o• 
    nnoremap o o• 
    nnoremap a A
    nnoremap A a
    colo default
    call Spell()
endfunction

function Match()
    " Match ", (, [, and {. { makes a matching pair a line below.
    inoremap " ""<Left>
    inoremap ( ()<Left>
    inoremap { {<CR>}<Esc>ko<Space><BS>
    inoremap [ []<Left>

    " Make tab go to outside next pair char.
    inoremap <silent> <Tab> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
    inoremap <S-Tab> <Tab>
endfunction

function Java()  
    iab pub public
    iab pri private
    iab Str String
    iab cls class 
    iab bool boolean
    iab doub double
endfunction

function Spell()
    setlocal spell 
    hi clear SpellBad
    hi SpellBad ctermbg=3
endfunction

