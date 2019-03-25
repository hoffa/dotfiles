se nocp
sy off
let mapleader=" "

se enc=utf-8
se lcs+=trail:_,tab:>-
se bs=2
se pt=<F2>

se et
se sw=4
se sts=4

se is
se hls
se ic

se stl=%f\ %l/%c\ %m%r%{&ff}\ %{(&fenc?&fenc:&enc)}\ %y

nn <CR> :noh<CR>
nn <Up> :se list!<CR>
nn <Left> :se nu!<CR>
nn <Right> :if exists("g:syntax_on") <Bar> sy off <Bar> else <Bar> sy on <Bar> endif<CR>
nn <Down> :if &ls == 1 <Bar> set ls=2 <Bar> else <Bar> set ls=1 <Bar> endif<CR>

nn <Leader>q :q<CR>
nn <Leader>x :q!<CR>
nn <Leader>w :w!<CR>
nn <Leader><Space> <C-w>w
nn <Leader>n :bn<CR>
nn <Leader>p :bp<CR>
nn <Leader>l :ls<CR>
