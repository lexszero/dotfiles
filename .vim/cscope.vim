if has("cscope")
	set csprg=/usr/bin/cscope
	set csqf=s-,c-,d-,i-,t-,e-
	set csto=0
	set cst
	set csre
	set csverb
	map <F12> :<C-R>=system("cscope -f .cscope -b -R -k ")<CR><CR>
	if ! cscope_connection(4, ".cscope")
		if filereadable(".cscope")
			cs add .cscope
		endif
	endif

	" To do the first type of search, hit 'CTRL-\', followed by one of the
	" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
	" search will be displayed in the current window.  You can use CTRL-T to
	" go back to where you were before the search.  
	"
	
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
	
	
	" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
	" makes the vim window split horizontally, with search result displayed in
	" the new window.
	"
	" (Note: earlier versions of vim may not have the :scs command, but it
	" can be simulated roughly via:
	"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	
	
	nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
	nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
	
	
	" Hitting CTRL-space *twice* before the search type does a vertical 
	" split instead of a horizontal one (vim 6 and up only)
	"
	" (Note: you may wish to put a 'set splitright' in your .vimrc
	" if you prefer the new window on the right instead of the left
	
	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif	
