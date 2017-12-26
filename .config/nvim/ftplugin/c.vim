source ~/.config/nvim/develop.vim
"source ~/.vim/neocomplete.vim
setlocal cindent

let g:c_syntax_folding = 1
let g:cpp_syntax_folding = 1

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0

let Tlist_Display_Prototype = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Highlight_Tag = 1
let g:SrcExpl_isUpdateTags = 0

nmap <leader>t :TlistToggle<CR>

" nice but slow
" TlistAddFilesRecursive ./

set completeopt-=preview

"nnoremap <leader>jd :YcmCompleter GoTo<CR>

"set complete=

source ~/.vim/cscope.vim

"if filereadable(".cctree")
"	CCTreeLoadXRefDB .cctree
"elseif filereadable(".cscope")
"	CCTreeLoadDB .cscope
"endif

