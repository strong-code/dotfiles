syntax on
colorscheme nord
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3

" Global config
set hidden
set cmdheight=2
set updatetime=300
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set statusline+=%F
set nu rnu
set backspace=indent,eol,start
set hlsearch

" Prevent WSL from entering us into replace mode
" https://superuser.com/a/1525060
set t_u7=

" Custom remappings
noremap <C-d> :term<cr>
nmap <leader>c <Plug>CommentaryLine
vmap <leader>c <Plug>Commentary
nnoremap <leader>s :Tex<cr> :tabm 0<cr>

" Clap remappings
" \f to open file finder
noremap <leader>f :Clap files<cr>

" <leader><space> to turn off search highlighting
nnoremap <leader><space> :noh<cr>

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
Plug 'tpope/vim-commentary', {'branch': 'master'}
Plug 'arcticicestudio/nord-vim', {'branch': 'main'}
Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary!'}
call plug#end()
