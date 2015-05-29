source ~/.vim/develop.vim
setlocal cindent

let Tlist_Display_Prototype = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Highlight_Tag = 1
let g:SrcExpl_isUpdateTags = 0

" nice but slow
" TlistAddFilesRecursive ./

set completeopt=menu,preview

nnoremap <leader>jd :YcmCompleter GoTo<CR>

"set complete=

"source ~/.vim/cscope.vim

"if filereadable(".cctree")
"	CCTreeLoadXRefDB .cctree
"elseif filereadable(".cscope")
"	CCTreeLoadDB .cscope
"endif

