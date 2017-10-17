" Chris' .vimrc
" No plugins or other tacky stuff

set nocompatible
set encoding=utf-8

syntax on
colorscheme default
set background=light

set title " Change terminal title to filename
set number " Show line numbers
set hidden " Hide buffers instead of closing them
set listchars=trail:·,tab:»·,eol:¬,nbsp:% " Characters to display when using :list
set backspace=indent,eol,start
set lazyredraw

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

" Useful statusline
set statusline=%n\ %f\ [%{(&fenc!=''?&fenc:&enc)}][%{&ff}]%y%r%m%w%<%=%c\ %l/%L\ 0x%02B\ %P

" Nice colors
hi LineNr ctermfg=8
hi Comment ctermfg=8
hi NonText ctermfg=8
hi Search ctermfg=0
hi Statement ctermfg=2
hi Identifier ctermfg=4
hi StatusLine cterm=none ctermfg=0 ctermbg=3

set pastetoggle=<F2>

" Scroll with arrow keys
noremap <Up> <C-U>
noremap <Down> <C-D>
noremap <Left> <Nop>
" Toggle show hidden characters
noremap <silent> <Right> :set list!<CR>

" Hide search results on <CR>
nnoremap <silent> <CR> :nohl<CR>
