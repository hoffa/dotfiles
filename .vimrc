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

filetype indent on " Use filetype-specific indenting
set autoindent " Indent when starting new line
set expandtab " Use spaces instead of tabs
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

set lazyredraw
set ttyfast

set statusline+=\ %f\ 
set statusline+=%<%=
set statusline+=%l:%c\ 
set statusline+=%{&ft}\ 
set statusline+=%{&ff}\ 
set statusline+=%{(&fenc!=''?&fenc:&enc)}\ 

hi LineNr ctermfg=8
hi Comment ctermfg=8
hi NonText ctermfg=8
hi Search ctermfg=0
hi Special ctermfg=5
hi Constant ctermfg=1
hi Type ctermfg=2
hi PreProc ctermfg=4
hi Statement ctermfg=3
hi Identifier ctermfg=6

hi StatusLine cterm=reverse ctermfg=4

set pastetoggle=<F2>

noremap <Up> <C-U>
noremap <Down> <C-D>
noremap <Left> <Nop>
noremap <Right> :set list!<CR>
nnoremap <CR> :nohl<CR>

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <Leader>z :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <Leader>q :q<CR>
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
