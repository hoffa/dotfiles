" Chris' .vimrc
" No plugins or other tacky stuff

set nocompatible
set encoding=utf-8
let mapleader=" "

syntax on

set tags=tags;/

set number
set listchars=trail:·,tab:»·,eol:¬,nbsp:% " Characters to display when using :list
set backspace=indent,eol,start

filetype indent on
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set showmatch
set incsearch
set hlsearch
set ignorecase

set laststatus=2
set showcmd
set wildmenu

set lazyredraw
set ttyfast

set statusline+=\ %f\ 
set statusline+=%<%=
set statusline+=%l:%c\ 
set statusline+=%{&ft}\ 
set statusline+=%{&ff}\ 
set statusline+=%{(&fenc!=''?&fenc:&enc)}\ 

set pastetoggle=<F2>

noremap <Up> <C-U>
noremap <Down> <C-D>
noremap <Left> <Nop>
noremap <Right> :set list!<CR>
nnoremap <CR> :nohl<CR>

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <Leader>z :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :q!<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader><Space> <C-W>w
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
nnoremap <Leader>b :Vexplore<CR>

let g:netrw_winsize=20
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_banner=0
