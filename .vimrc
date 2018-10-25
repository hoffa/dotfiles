" Chris' .vimrc
" No plugins or other tacky stuff

set nocompatible
set encoding=utf-8
set listchars=trail:·,tab:»·,eol:¬,nbsp:% " Characters to display when using :list
set backspace=indent,eol,start
set tags=tags;/
set number
set lazyredraw
set ttyfast
syntax on
let mapleader=" "

" Indentation
filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4

" Search
set showmatch
set incsearch
set hlsearch
set ignorecase
nnoremap <CR> :nohl<CR>

" Status stuff
set laststatus=2
set showcmd
set wildmenu
set statusline=%f\ %m%r%<%=%l:%c\ %y\ %{&ff}\ %{(&fenc!=''?&fenc:&enc)}

" Basics
set pastetoggle=<Down>
nnoremap <Up> :set list!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :q!<CR>
nnoremap <Leader>w :w!<CR>
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <Leader>z :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Tabs
nnoremap <Leader>t :tabnew<CR>
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader><Space> <C-w>w

" Buffers
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>

" Netrw
nnoremap <Leader>b :Vex<CR>
let g:netrw_winsize=20
let g:netrw_browse_split=4
