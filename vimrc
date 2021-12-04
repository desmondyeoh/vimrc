et nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" =========================================
" MY VUNDLE PLUGINS
" =========================================
" SimpylFold allows Python code to fold nicely (usually it will fold a lot
" more lines)
Plugin 'tmhedberg/SimpylFold'
" autoindent python - follows PEP8
Plugin 'vim-scripts/indentpython.vim'
" YouCompleteMe - python auto-complete
Bundle 'Valloric/YouCompleteMe'
" Syntax checking / highlight
Plugin 'vim-syntastic/syntastic'
" PEP 8 checking
Plugin 'nvie/vim-flake8'


" -----------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =========================================
" MY CUSTOM SETUP
" =========================================
" splitting will put new window by default to up and left
set splitbelow
set splitright

" Move between splits
" C-JKLH - move to below/above/right/left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding of code (like methods & classes)
set foldmethod=indent
set foldlevel=99
" za means to toggle fold & unfold. below allow to use space instead
nnoremap <space> za

" SimpylFold still show Python docstrings
let g:SimpylFold_docstring_preview=1

" PEP 8 indentation
au BufNewFile,BufRead *.py
    \  set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

" Other file types indentations
au BufNewFile,BufRead *.js,*.html,*.css
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" Make code look pretty
let python_highlight_all=1
syntax on

" UTF-8 support
set encoding=utf-8

" =========================================
" COLOR THEME
" =========================================

" this have to put before the white space highlight below
colorscheme onedark

" Flag white space
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
    \  match BadWhitespace /\s\+$/

" -----------------------------------------

" python: virtual env support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
