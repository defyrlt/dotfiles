set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Plugin 'davidhalter/jedi-vim' 
Plugin 'szw/vim-tags'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'wting/rust.vim'
Plugin 'valloric/YouCompleteMe'
Plugin 'jmcantrell/vim-virtualenv'

call vundle#end()
filetype plugin indent on

let mapleader=","

set laststatus=2
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab
set number
set cc=80
set splitbelow
set splitright
set clipboard=unnamed
set wildignore+=*.pyc
set encoding=utf-8

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" colorscheme molokai
syntax enable
set background=dark
colorscheme solarized
" let g:pymode_rope = 0 
" let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
" let g:pymode_lint_cwindow = 0
" let g:pymode_virtualenv = 1
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" let g:pymode_folding = 0

let g:airline_theme='badwolf'

let g:ctrlp_custom_ignore = {'dir': '\.git$'}

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
" let g:jedi#use_tabs_not_buffers = 0

let g:tagbar_autofocus = 1

let g:flake8_show_in_gutter=1
autocmd BufWritePost *.py call Flake8()

let g:autopep8_ignore="E501"
let g:autopep8_disable_show_diff=1

let g:solarized_termcolors=256

let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

let g:gitgutter_max_signs = 1000

map <F2> :NERDTreeToggle<CR>
" map <C-S-F8> :PymodeLintAuto<CR>
map <leader>d :YcmCompleter GoTo<CR>
map <leader>sf yw:vimgrep "<C-R>"" **/*.py

noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gdiff<CR>

noremap <Leader>y 'aV'b"+y

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>c ^i# <ESC>
nnoremap <Leader>C ^i<Del><Del><ESC><Right>

nnoremap <leader>b oimport ipdb; ipdb.set_trace()<ESC>
nnoremap <F4> :set hlsearch! hlsearch?<CR>
" nnoremap <leader>hl :set hlsearch<CR>
" nnoremap <leader>nh :set nohlsearch<CR>
nnoremap <leader>f :vimgrep "" **/*.py<left><left><left><left><left><left><left><left><left>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <leader>cw :cwindow<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>c I# <ESC><ESC>
vnoremap <leader>C lx

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

syntax on
