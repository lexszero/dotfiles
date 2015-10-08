"let g:pathogen_disabled=["csapprox"]
call pathogen#infect()

set t_Co=256
let g:colorschemedegrade_ignore=""
colorscheme mycolors

nmap <leader>h :BufSurfBack<CR>
nmap <leader>l :BufSurfForward<CR>

nmap <leader>a :Ag<Space>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

let g:ycm_global_ycm_extra_conf="~/.vim/ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt=1

" source various stuff
source ~/.vim/binary.vim
source ~/.vim/header_guard.vim
source ~/.vim/ranger.vim
source ~/.vim/backups.vim
