set number
syntax on
colorscheme nord
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set statusline+=%F
let g:netrw_banner = 0
let g:netrw_browse_split = 3

" Plugins
call plug#begin('~/.vim/plugins')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
