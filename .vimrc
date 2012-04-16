set cindent
set cursorline
set encoding=utf8
set expandtab
set fileencoding=utf8
set fileencodings=ucs-bom,utf8,cp950,latin1
set guifont=Inconsolata:h12
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▷⋅,trail:·
set nobomb
set nocompatible
set number
set ruler
set scrolloff=3
set secure
set shiftwidth=4
set showmatch
set smartcase
set t_Co=256
set visualbell
set wildmenu
syntax on
"
" color schema
set background=dark
let g:solarized_termcolors=256
colo solarized
highlight Search cterm=none ctermbg=blue
"
" keybinding
nmap <Esc>[Z <C-w>W
nmap <Tab> <C-w>w
"
" template
function LoadHTMLTemplate()
    0r ~/.vim/template/production.html
    normal Gdd
endfunction
function LoadPHPTemplate()
    0r ~/.vim/template/production.php
    normal Gdd
endfunction
function LoadPerlTemplate()
    0r ~/.vim/template/production.pl
    normal Gdd
endfunction
function LoadShellTemplate()
    0r ~/.vim/template/production.sh
    normal Gdd
endfunction

autocmd BufNewFile *.html call LoadHTMLTemplate()
autocmd BufNewFile *.pl call LoadPerlTemplate()
autocmd BufNewFile *.php call LoadPHPTemplate()
autocmd BufNewFile *.sh call LoadShellTemplate()
"
" other
au BufNewFile,BufRead *.mk set noexpandtab
au BufNewFile,BufRead *.json setf json
au BufNewFile,BufRead *.psgi setf perl
au BufNewFile,BufRead Makefile set noexpandtab
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"
call pathogen#infect()
