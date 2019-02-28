" Chris' .vimrc

set nocompatible
set encoding=utf-8
set listchars=trail:·,tab:»·,eol:¬
set backspace=indent,eol,start
set tags=tags;/
let mapleader=" "

filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4

set incsearch
set hlsearch
set ignorecase
nnoremap <CR> :nohl<CR>

set laststatus=2
set statusline=%f\ %y\ %{&ff}\ %{(&fenc?&fenc:&enc)}\ %l/%c\ %p%%\ %m%r

set pastetoggle=<Down>
nnoremap <Up> :set list!<CR>
nnoremap <Left> :set nu!<CR>
nnoremap <Right> :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :q!<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader><Space> <C-w>w
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
nnoremap <Leader>m :ls<CR>
nnoremap <Leader>b :Ex<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>s :sp<CR>

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <Leader>z :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
