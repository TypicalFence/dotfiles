call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

Plug 'w0rp/ale'
  

" js
Plug 'HerringtonDarkholme/yats.vim' " ts syntax
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'amadeus/vim-jsx', { 'for': ['javascript.jsx', 'typescript.jsx'] }
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'


" go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}


" python
Plug 'deoplete-plugins/deoplete-jedi'
 


let g:deoplete#sources#jedi#python_path = "python3"

" ternjs shit

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for 
" properties) between the completions and the origin position in the result 
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of 
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0

let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

scriptencoding utf-8

set tabstop=4       " The width of a TAB is set to 4 
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

set number


nnoremap <C-W> :bnext<CR>
nnoremap <C-B> :bprevious<CR>


" disable mouse
set mouse=a

let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])

" hide racer crash reports
call deoplete#custom#option('check_stderr', 0)

let g:racer_experimental_completer = 1
let g:racer_disable_errors = 1


let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_linter_aliases = {'javascriptreact': 'javascript'}
"let b:ale_fixers = { 'javascript': ['eslint'], 'javascript.jsx': ['eslint'],  'typescript': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'javascript.jsx': ['eslint'],  'javascriptreact': ['eslint'], 'typescript': ['eslint'] }
let g:ale_fix_on_save = 1
