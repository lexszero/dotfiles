source ~/.config/nvim/develop.vim
"source ~/.vim/neocomplete.vim

let g:go_fmt_experimental = 1

let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_fmt_autosave = 1

"setlocal omnifunc=gocomplete#Complete
nnoremap <leader>d :GoDoc<CR>

nmap <C-\>g :GoDef<CR>
nmap <C-\>i :GoImplements<CR>
nmap <C-\>c :GoCallees<CR>
nmap <C-\>d :GoDocBrowser<CR>
