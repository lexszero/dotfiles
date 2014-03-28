"let g:pathogen_disabled=["csapprox"]
call pathogen#infect()

" global vim stuff
set t_Co=256
let g:colorschemedegrade_ignore=""
colorscheme mycolors
set nocompatible
set mouse=a
set showcmd
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
setlocal list
setlocal listchars=tab:·\ ,trail:·
" no more finger-bending to reach Esc!
inoremap jj <ESC>
"noremap j h
"noremap k j
"noremap l k
"noremap ; l

filetype on
filetype plugin on

" buffers history
nmap <leader>h :BufSurfBack<CR>
nmap <leader>l :BufSurfForward<CR>

" Ack plugin
nmap <leader>a :Ack<Space>

" tabulation prefs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" line wrapping stuff
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" search
nnoremap <leader><space> :nohlsearch<cr>
nmap <F3> :nohlsearch<CR>
imap <F3> <Esc>:nohlsearch<CR>
vmap <F3> <Esc>:nohlsearch<CR>
" disable shitty vim regex syntax
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set wrapscan

" don't remember, wtf is that, let it be :3
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap <F2> :Bufferlist<CR>
imap <F2> <Esc>:Bufferlist<CR>
vmap <F2> <Esc>:Bufferlist<CR>

nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

map <Esc>1 1gt
map <Esc>2 2gt
map <Esc>3 3gt
map <Esc>4 4gt
map <Esc>5 5gt
map <Esc>6 6gt
map <Esc>7 7gt
map <Esc>8 8gt
map <Esc>9 9gt

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" source various stuff
source ~/.vim/binary.vim
source ~/.vim/header_guard.vim
source ~/.vim/ranger.vim

