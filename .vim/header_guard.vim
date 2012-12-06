function! s:insert_header_guard()
	let guardname = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef " . guardname
	execute "normal! o#define " . guardname
	execute "normal! 3o"
	execute "normal! Go#endif /* " . guardname . " */"
	normal! kk
endfunction
autocmd! BufNewFile *.{h,hpp} call <SID>insert_header_guard()
