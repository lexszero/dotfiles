source ~/.vim/develop.vim
setlocal omnifunc=gocomplete#Complete
nnoremap <leader>d :Godoc<CR>
setlocal makeprg="go build -x"
