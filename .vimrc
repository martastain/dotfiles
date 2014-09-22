filetype plugin on
filetype indent on

set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc

set ruler
set backspace=indent,eol,start

set smartcase

set hlsearch
set incsearch

set lazyredraw

set magic
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set showmatch
syntax enable

set bg=dark
set t_Co=256

let g:molokai_original = 1
colorscheme molokai


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set shiftwidth=1
set tabstop=1