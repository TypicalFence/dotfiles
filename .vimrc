"=̉=======================================================================================
" Plugins
"========================================================================================
call plug#begin('~/.vim/plugged')
    Plug 'google/vim-maktaba'
    Plug 'tpope/vim-sensible'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'ap/vim-buftabline'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree',  { 'on':  'NERDTreeToggle' } 
    Plug 'vim-airline/vim-airline'
    Plug 'jpalardy/vim-slime'
    Plug 'bazelbuild/vim-bazel', { 'on':  'Bazel' }

    Plug 'w0rp/ale'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    endif     

    " js
    if has('nvim')
        Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
    endif
    Plug 'amadeus/vim-jsx', { 'for': ['javascript.jsx', 'typescript.jsx'] }
    if has('nvim')
        Plug 'mhartington/nvim-typescript', {'do': './install.sh', 'for': ['typescript', 'typescript.jsx'] }
    endif
    "Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

    " rust
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }


    " go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make', 'for': 'go' }


    " python
    Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
    Plug 'davidhalter/jedi-vim', { 'for': 'python' }
    Plug 'hylang/vim-hy', { 'for': 'hy' }
    
    " dart
    Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

    " erlang
    Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
    Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
    
    " racket
    Plug 'wlangstroth/vim-racket', { 'for':  ['scheme', 'racket'] }
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

set showcmd

nnoremap <C-W> :bnext<CR>
nnoremap <C-B> :bprevious<CR>
nnoremap <leader>< :bnext<CR>
nnoremap <leader>> :bprevious<CR>
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

"========================================================================================
" Language Agnostic
"========================================================================================

let g:slime_target = "tmux"
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_linter_aliases = {'javascriptreact': 'javascript'}
let g:ale_linters = { 
            \ 'java': ['javac'], 
            \ "c": ['gcc'], 
            \ "cpp": ['gcc'] 
            \ }
let g:ale_fixers = { 
            \ 'javascript': ['eslint'], 
            \ 'typescript': ['eslint', 'tslint'], 
            \ 'python': ['autopep8'], 
            \ 'elixir': ['mix_format'], 
            \ 'rust': ['rustfmt'], 
            \ 'java': ['uncrustify'] 
            \ }
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
if has("nvim")
    call deoplete#custom#option('check_stderr', 0)
endif

let g:racer_experimental_completer = 1
let g:racer_disable_errors = 1
let g:ale_java_javac_classpath = $CLASSPATH


let g:ale_c_gcc_executable = $CURRENT_GCC
let g:ale_c_gcc_options = $CURRENT_GCC_OPTS
let g:ale_cpp_gcc_executable = $CURRENT_GXX
let g:ale_cpp_gcc_options = $CURRENT_GXX_OPTS 
