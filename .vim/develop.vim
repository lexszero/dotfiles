setlocal nowrap
setlocal foldlevelstart=0
setlocal foldmethod=syntax
setlocal relativenumber
setlocal undofile
setlocal list
setlocal listchars=tab:·\ ,trail:·,eol:↵
setlocal wildoptions=tagfile

" taglist plugin mappings
nmap <leader>t :TlistToggle<CR>
imap <leader>t <Esc>:TlistToggle<CR>
vmap <leader>t <Esc>:TlistToggle<CR>

nmap <leader>n :NERDTreeToggle<CR>
imap <leader>n <Esc>:NERDTreeToggle<CR>
vmap <leader>n <Esc>:NERDTreeToggle<CR>

au BufWinLeave * mkview
au BufWinLeave * silent loadview
