call plug#begin('~/.vim/plugged')
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" Optional: If you want a nice status line in Vim
Plug 'vim-airline/vim-airline'

Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
call plug#end()


scriptencoding utf-8

set tabstop=4       " The width of a TAB is set to 4 
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" disable mouse
set mouse=""

let NERDTreeDirArrowExpandable = "▶"
let NERDTreeDirArrowCollapsible = "▼"

let g:codestats_api_key = 'sekrit'

" Optional: configure vim-airline to display status
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])
