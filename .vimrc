"========================================================================================
" Plugins
"========================================================================================
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'ap/vim-buftabline'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'

    Plug 'w0rp/ale'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    endif     

    " js
    Plug 'HerringtonDarkholme/yats.vim' " ts syntax
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'amadeus/vim-jsx', { 'for': ['javascript.jsx', 'typescript.jsx'] }
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

    " rust
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'


    " go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}


    " python
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'

    " dart
    Plug 'dart-lang/dart-vim-plugin'
call plug#end()

if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

"========================================================================================
" Basics
"========================================================================================
scriptencoding utf-8
set number
set mouse=a

set tabstop=4       " The width of a TAB is set to 4 
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

"========================================================================================
" Language Agnostic
"========================================================================================
nnoremap <C-W> :bnext<CR>
nnoremap <C-B> :bprevious<CR>

let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_linter_aliases = {'javascriptreact': 'javascript'}
let g:ale_fixers = { 'javascript': ['eslint'], 'typescript': ['eslint'], 'python': ['autopep8'] }
let g:ale_fix_on_save = 1
"========================================================================================
" Python 
"========================================================================================
let g:deoplete#sources#jedi#python_path = "python3"
let g:jedi#completions_enabled = 0


"========================================================================================
" Javascript 
"========================================================================================
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#guess = 0
let g:deoplete#sources#ternjs#sort = 0
let g:deoplete#sources#ternjs#expand_word_forward = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#in_literal = 0
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

"========================================================================================
" Rust 
"========================================================================================
" hide racer crash reports
call deoplete#custom#option('check_stderr', 0)

let g:racer_experimental_completer = 1
let g:racer_disable_errors = 1


