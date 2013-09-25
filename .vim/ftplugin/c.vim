source ~/.vim/develop.vim
setlocal cindent

let Tlist_Display_Prototype = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Highlight_Tag = 1
let g:SrcExpl_isUpdateTags = 0

" nice but slow
" TlistAddFilesRecursive ./

" --- OmniCppComplete ---
" auto close options when exiting insert mode
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,preview
"call omni#cpp#complete#Init()
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_SelectFirstItem = 1
"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

let g:clang_auto_select = 1
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_periodic_quickfix = 0
let g:clang_trailing_placeholder = 0
let g:clang_close_preview = 1
let g:clang_user_options = "-std=c99 -Wall -Wextra"
let g:clang_auto_user_options = "local, .clang_complete, clang"
let g:clang_library_path = '/usr/lib64/llvm'
let g:clang_use_library = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1

"set complete=

source ~/.vim/cscope.vim

"if filereadable(".cctree")
"	CCTreeLoadXRefDB .cctree
"elseif filereadable(".cscope")
"	CCTreeLoadDB .cscope
"endif

