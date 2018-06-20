" Chris' .vimrc
" No plugins or other tacky stuff

set nocompatible
set encoding=utf-8
let mapleader=" "

syntax on
colorscheme default
set background=light

set tags=tags;/

set title " Change terminal title to filename
set number " Show line numbers
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

" Speed up a bit
set lazyredraw
set ttyfast

set noerrorbells
set novisualbell

" Make italics work
set t_ZH=[3m
set t_ZR=[23m

hi User1 ctermbg=3 ctermfg=0
hi User2 ctermbg=2
hi User3 ctermbg=5 ctermfg=7
hi User4 ctermbg=4
hi User5 ctermbg=5
hi User6 ctermbg=6
hi User7 ctermbg=7 ctermfg=8
hi User8 ctermbg=8 ctermfg=7
hi User9 ctermbg=0

set statusline=
set statusline+=%1*\ %n\ 
set statusline+=%3*\ %f\ 
set statusline+=%8*\ %{&ft}\ 
set statusline+=%7*\ 0x%02B\ 
set statusline+=%7*%<%=
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\ 
set statusline+=%8*\ %{&ff}\ 
set statusline+=%3*\ %l:%c\ 
set statusline+=%1*\ %P\ 

hi LineNr ctermfg=8
hi Comment ctermfg=8 cterm=italic
hi NonText ctermfg=8
hi Search ctermfg=0
hi VertSplit ctermbg=8 ctermfg=8
hi Special cterm=italic ctermfg=5
hi Constant cterm=italic ctermfg=1
hi Type cterm=italic ctermfg=2
hi PreProc cterm=italic ctermfg=4
hi Statement cterm=italic ctermfg=3
hi Identifier cterm=italic ctermfg=6

hi StatusLineNC cterm=none ctermbg=2
hi StatusLine cterm=none ctermbg=2 ctermfg=0
au InsertLeave * hi StatusLine ctermbg=2
au InsertEnter * hi StatusLine ctermbg=3

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
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :Vexplore<CR>
nnoremap <Leader>t :! c<CR>

let g:netrw_winsize=20
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
