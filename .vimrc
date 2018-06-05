call plug#begin('~/.vim/plugged')
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" Optional: If you want a nice status line in Vim
Plug 'vim-airline/vim-airline'

Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
call plug#end()


scriptencoding utf-8

let NERDTreeDirArrowExpandable = "▶"
let NERDTreeDirArrowCollapsible = "▼"

let g:codestats_api_key = 'sekrit'

" Optional: configure vim-airline to display status
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])
