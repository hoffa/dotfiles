" Christoffer Rehn's .vimrc
" No plugins or other tacky stuff

set nocompatible
set encoding=utf-8
let mapleader=" "

syntax on
colorscheme turtles

set title " Change terminal title to filename
set number " Show line numbers
set hidden " Hide buffers instead of closing them
set listchars=trail:·,tab:»·,eol:¬,nbsp:% " Characters to display when using :list
set scroll=4 " Lines to scroll with <C-U> and <C-D>

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

set laststatus=2 " Always show status line
set history=1000 " Command history size
set showcmd " Show last command in bottom bar
set wildmenu " Enable better command line completion

" Useful statusline
set statusline=\ %n\ %f\ [%{(&fenc!=''?&fenc:&enc)}][%{&ff}]%y%r%m%w%<%=%c\ %l/%L\ 0x%02B\ %P\ 

" Nice colors
hi Normal ctermbg=none
hi LineNr ctermbg=none
hi StatusLine cterm=none ctermfg=2 ctermbg=none
au InsertEnter * hi StatusLine ctermfg=1
au InsertLeave * hi StatusLine ctermfg=2

" Scroll with arrow keys
noremap <Up> <C-U>
noremap <Down> <C-D>
noremap <Left> <Nop>
" Toggle show hidden characters
noremap <silent> <Right> :set list!<CR>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Hide search results on <CR>
nnoremap <silent> <CR> :nohl<CR>

" Display file tree on the left
nnoremap <Leader>n :Vexplore<CR>
let g:netrw_winsize=-30 " Absolute window width
let g:netrw_liststyle=3 " Show as tree
let g:netrw_banner=0 " Hide extra information at the top
let g:netrw_browse_split=4 " Open in previous window
let g:netrw_altv=1 " Split to the right
let g:netrw_sort_sequence="[\/]$,*" " Sort directories first
