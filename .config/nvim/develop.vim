setlocal nowrap
setlocal foldlevelstart=0
setlocal foldmethod=syntax
setlocal relativenumber
setlocal undofile
setlocal wildoptions=tagfile

let g:ctrlp_extensions = ['mixed', 'buffertag', 'quickfix', 'dir',
                           \ 'undo', 'line', 'changes', 'bookmarkdir']


"au BufWinLeave * mkview
"au BufWinLeave * silent loadview

set list
set listchars=tab:·\ ,trail:·

let g:deoplete#disable_auto_complete = 1
call deoplete#custom#set('_', 'converters', [
			\ 'converter_remove_overlap',
			\ 'converter_truncate_abbr',
			\ 'converter_truncate_menu',
			\ 'converter_auto_delimiter'
			\ ])

call deoplete#custom#set('neosnippet', 'rank', 1000)
call deoplete#custom#set('around', 'rank', 900)
call deoplete#custom#set('clang_complete', 'rank', 800)
call deoplete#custom#set('buffer', 'rank', 10)

call deoplete#enable()

function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:neosnippet_complete()
	if pumvisible()
		return "\<c-n>"
	else
		if neosnippet#expandable_or_jumpable() 
			return "\<Plug>(neosnippet_expand_or_jump)"
		endif
		let col = col('.') - 1
		if !col || getline('.')[col - 1] =~ '\s'
			return "\<tab>"
		endif
		return deoplete#manual_complete()
	endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()
smap <expr><TAB> <SID>neosnippet_complete()
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#snippets_directory = "$HOME/.config/nvim/snippets"

call echodoc#enable()

