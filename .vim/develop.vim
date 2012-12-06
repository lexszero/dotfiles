setlocal nowrap
setlocal foldlevelstart=0
setlocal foldmethod=syntax
setlocal relativenumber
setlocal undofile
setlocal list
setlocal listchars=tab:·\ ,trail:·,eol:↵
setlocal wildoptions=tagfile

nmap <leader>t :TrinityToggleTagList<CR>
nmap <leader>s :TrinityToggleSourceExplorer<CR>
nmap <leader>n :TrinityToggleNERDTree<CR>
nmap <leader>i :TrinityToggleAll<CR>

nmap <leader>a :Ack<Space>

"au BufWinLeave * mkview
"au BufWinLeave * silent loadview
