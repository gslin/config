set cindent
set cursorline
set directory=~/tmp
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
set showmatch
set smartcase
set t_Co=256
set visualbell
set wildmenu
syntax on
"
" color schema
set background=dark
highlight CursorLine cterm=none ctermbg=darkblue
"
" keybinding
nmap <Esc>[Z <C-w>W
nmap <Tab> <C-w>w
"
" other
au BufNewFile,BufRead *.psgi setf perl
au BufNewFile,BufRead Makefile set noexpandtab
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
