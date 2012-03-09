source ~/.vim/develop.vim
setlocal cindent

let Tlist_Display_Prototype = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Highlight_Tag = 1
" nice but slow
" TlistAddFilesRecursive ./

" --- OmniCppComplete ---
" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,preview
call omni#cpp#complete#Init()
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_SelectFirstItem = 1
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

map <F12> :!ctags -R --c-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
set tags=tags

function! s:insert_header_guard()
	let guardname = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef " . guardname
	execute "normal! o#define " . guardname
	execute "normal! 3o"
	execute "normal! Go#endif /* " . guardname . " */"
	normal! kk
endfunction
autocmd! BufNewFile *.{h,hpp} call <SID>insert_header_guard()
