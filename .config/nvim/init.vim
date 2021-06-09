set nocompatible
filetype off

let g:ale_disable_lsp = 1

call plug#begin()

"Plug 'godlygeek/csapprox'		" color scheme approximation
Plug 'Shougo/vimproc'
Plug 'jamessan/vim-gnupg'
Plug 'bkad/CamelCaseMotion'
Plug 'ton/vim-bufsurf'
Plug 'tpope/vim-scriptease'
Plug 'vim-scripts/extended-help'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gelguy/wilder.nvim'
Plug 'scrooloose/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'embear/vim-localvimrc'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-unimpaired'

Plug 'Shougo/echodoc.vim'
Plug 'Konfekt/FastFold'

"💚 coc 💚 
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = [
			\ 'coc-clangd',
			\ 'coc-explorer',
			\ 'coc-git',
			\ 'coc-json',
			\ 'coc-neosnippet',
			\ 'coc-protobuf',
			\ 'coc-pyright',
			\ 'coc-sh',
			\ 'coc-snippets',
			\ 'coc-tsdetect',
			\ 'coc-tsserver',
			\]

Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/vim-ale-icons'
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
Plug 'puremourning/vimspector'
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

" filetype=c
Plug 'scrooloose/nerdcommenter', { 'for': 'c' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neoinclude.vim'

Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }


" filetype plugins
" common stuff
Plug 'vim-utils/vim-man'
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'tpope/vim-speeddating', { 'for': 'org' }
Plug 'kergoth/vim-bitbake'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'godlygeek/tabular', { 'for': 'markdown' }			" ascii tables for markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" PlantUML
Plug 'aklt/plantuml-syntax'
"Plug 'scrooloose/vim-slumlord'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'

" filetype=go
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
"Plug 'zchee/deoplete-go', { 'for': 'go' }

Plug 'rust-lang/rust.vim'
"Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

Plug 'evanleck/vim-svelte', {'branch': 'main'}
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" filetype=processin
Plug 'sophacles/vim-processing', { 'for': 'processing' }
"Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()
filetype plugin indent on

set visualbell
set titlelen=200
"set t_Co=256
"let g:colorschemedegrade_ignore=""
set termguicolors
colorscheme mycolors

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=#101010
hi IndentGuidesEven guibg=#202020

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)
nmap <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-h> :History<CR>
nmap <leader>m :Maps<CR>
nmap <C-colon> :Commands
nmap <C-/> :Helptags<CR>

" Mappings using CoCList:
nnoremap <silent> <space><space>  :<C-u>CocFzfList<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

" Show explorer
nnoremap <silent> <space>e  :<C-u>CocCommand explorer<cr>

" For bash syntax
let g:is_bash = 1
let g:sh_fold_enabled = 1

"
nmap <leader>h :BufSurfBack<CR>
nmap <leader>l :BufSurfForward<CR>

nmap <leader>a :Ag<Space>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

set mouse=a
set showcmd
set noshowmode
set hidden
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set splitright
" no more finger-bending to reach Esc!
inoremap jj <ESC>
"noremap j h
"noremap k j
"noremap l k
"noremap ; l

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
noremap <silent> <leader><space> :nohlsearch<cr>
nmap <F3> :nohlsearch<CR>
imap <F3> <Esc>:nohlsearch<CR>
vmap <F3> <Esc>:nohlsearch<CR>
set langmap=*#,#*
" disable shitty vim regex syntax
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set wrapscan

nmap <F5> :e<CR>

" jump to last position in the file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

map <C-A> <C-W>

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
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist = [
	\ '/home/lexs/projects/.*',
	\ '/home/lexs/work/.*'
\]
"let g:localvimrc_debug = 3

let g:fastfold_savehook = 1
let g:mkdp_open_to_the_world = 1

runtime ui.vim
