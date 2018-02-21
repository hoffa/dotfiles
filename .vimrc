" Chris' .vimrc
" No plugins or other tacky stuff

set nocompatible
set encoding=utf-8
let mapleader=" "

syntax on
colorscheme default
set background=light

set title " Change terminal title to filename
set number " Show line numbers
set listchars=trail:·,tab:»·,eol:¬,nbsp:% " Characters to display when using :list
set backspace=indent,eol,start

filetype indent on " Use filetype-specific indenting
set autoindent " Indent when starting new line
set smartindent " Be a bit smarter about it
set expandtab " Use spaces instead of tabs
set smarttab " Be smart about what tab to insert
set shiftwidth=4 " Spaces when reindenting
set softtabstop=4 " Spaces when hitting tab
set tabstop=4 " Visual spaces per tab

set showmatch " Highlight matching bracket
set incsearch " Search as characters are entered
set hlsearch " Highlight search results
set ignorecase

set laststatus=2 " Always show status line
set showcmd " Show last command in bottom bar
set wildmenu " Enable better command line completion

" Speed up a bit
set lazyredraw
set ttyfast

set noerrorbells
set novisualbell

" Useful statusline
set statusline=%n\ %f\ [%{(&fenc!=''?&fenc:&enc)}][%{&ff}]%y%r%m%w%<%=%c\ %l:%L\ 0x%02B\ %P

" Nice colors
hi LineNr ctermfg=8
hi Comment ctermfg=8
hi NonText ctermfg=8
hi Search ctermfg=0
hi VertSplit ctermbg=8 ctermfg=8
hi Type cterm=bold
hi PreProc cterm=bold
hi Special cterm=bold
hi Constant cterm=bold ctermfg=1
hi Statement cterm=bold ctermfg=2
hi Identifier cterm=bold ctermfg=4
hi StatusLineNC cterm=none ctermfg=3 ctermbg=8
hi StatusLine cterm=none ctermfg=0 ctermbg=3
au InsertLeave * hi StatusLine ctermfg=0 ctermbg=3
au InsertEnter * hi StatusLine ctermfg=0 ctermbg=2

set pastetoggle=<F2>

noremap <Up> <C-U>
noremap <Down> <C-D>
noremap <Left> <Nop>
noremap <Right> :set list!<CR>
nnoremap <CR> :nohl<CR>  AAa

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <Leader>z :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader><Space> <C-W>w
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :Vexplore<CR>

let g:netrw_winsize=25
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altv=1
