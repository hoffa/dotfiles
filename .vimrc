sy on

se bg=light
se enc=utf-8
se lcs=eol:$,trail:.,tab:+-
se bs=2
se ru

se et
se ts=4
se sw=0

se autoread
au BufWritePost *.go silent! !gofmt -w %
au BufWritePost *.sh silent! !shfmt -w %
au BufWritePost *.py silent! !black -q %

se is
se hls
nn <CR> :noh<CR>

nn <Left> :se nu!<CR>
nn <Right> :se list!<CR>
