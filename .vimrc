"
set backspace=indent,eol,start
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
set nofoldenable
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
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:airline_powerline_fonts = 1
let g:solarized_termcolors=256
colo solarized
highlight Search cterm=none ctermbg=blue
"
" keybinding
nmap <Esc>[Z <C-w>W
nmap <Tab> <C-w>w
"
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"
Bundle "gmarik/vundle"
"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "airblade/vim-gitgutter"
Bundle "ap/vim-css-color"
Bundle "bling/vim-airline"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "kien/ctrlp.vim"
Bundle "motemen/git-vim"
Bundle "tomtom/tlib_vim"
"
filetype plugin indent on
"
" other
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.json setf json
au BufNewFile,BufRead *.mk set noexpandtab
au BufNewFile,BufRead *.psgi setf perl
au BufNewFile,BufRead Makefile set noexpandtab
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
