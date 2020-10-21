syntax on
colorscheme nord
let g:netrw_banner = 0
let g:netrw_browse_split = 3

" Global config
set hidden
set cmdheight=2
set updatetime=300
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set statusline+=%F
set nu rnu

" Custom remappings
noremap <C-d> :term<cr>

" COC config
" Use <c-space> to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><exp> <c-space> coc#refresh()

" Plugins
call plug#begin('~/.vim/plugins')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
