let g:airline_powerline_fonts=1
let g:airline#extensions#coc#enable = 0
let g:airline#extensions#ale#warning_symbol = '☹ '
let g:airline#extensions#ale#error_symbol = '⚠ '
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)
nmap <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-h> :History<CR>
nnoremap <C-F1> :Maps<CR>
nnoremap <F1> :Helptags<CR>
"nmap <C-colon> :Commands

call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))

let g:coc_explorer_global_presets = {
\   'defaultLeft': {
\   },
\   'defaultFloatRight': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'root-uri': 'workspace.rootPath',
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'root-uri': 'workspace.rootPath',
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
" Show explorer
nnoremap <space>ee  :<C-u>CocCommand explorer<cr>
nnoremap <space>ew :CocCommand explorer --preset defaultLeft<CR>
nnoremap <space>ef :CocCommand explorer --preset defaultFloatRight<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>
nnoremap <space>el :CocList explPresets<CR>
