se nocp
sy off

se enc=utf-8
se lcs+=trail:_,tab:>-
se bs=2
se ru

se et
se sw=4
se sts=4

se is
se hls
se ic

nn <CR> :noh<CR>
nn <Up> :se list!<CR>
nn <Left> :se nu!<CR>
nn <Right> :if exists("g:syntax_on") <Bar> sy off <Bar> else <Bar> sy on <Bar> endif<CR>
se pt=<Down>
