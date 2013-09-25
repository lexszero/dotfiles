setlocal nowrap
setlocal foldlevelstart=0
setlocal foldmethod=syntax
setlocal relativenumber
setlocal undofile
setlocal wildoptions=tagfile

nmap <leader>t :TrinityToggleTagList<CR>
nmap <leader>s :TrinityToggleSourceExplorer<CR>
nmap <leader>n :TrinityToggleNERDTree<CR>
nmap <leader>i :TrinityToggleAll<CR>

"au BufWinLeave * mkview
"au BufWinLeave * silent loadview
