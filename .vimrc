call plug#begin('~/.vim/plugged')
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
   
" Optional: If you want a nice status line in Vim
Plug 'vim-airline/vim-airline'

Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'airblade/vim-gitgutter'

call plug#end()


scriptencoding utf-8

set tabstop=4       " The width of a TAB is set to 4 
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set number

let g:flake8_show_in_gutter = 1
let g:flake8_show_in_file = 1
let g:flake8_show_quickfix=0
autocmd BufWritePost *.py call Flake8()


nnoremap <C-W> :bnext<CR>
nnoremap <C-B> :bprevious<CR>


" disable mouse
"set mouse=a

let g:codestats_api_key = 'no'

" Optional: configure vim-airline to display status
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])
"let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])

