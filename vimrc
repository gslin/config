nmap <Esc>[Z <C-w>W
nmap <Tab> <C-w>w
set background=dark
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
set showmatch
set smartcase
set t_Co=256
set visualbell
set wildmenu
syntax on
au BufNewFile,BufRead *.psgi setf perl
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
