set nocompatible
filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

colorscheme dracula
syntax on
filetype plugin indent on
let mapleader = ' '
set modelines=0
set number
set ruler
set visualbell
set encoding=utf-8
set nowrap
set textwidth=120
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set splitright
set splitbelow

" Keep backups out of my workspace
set backupdir=~/.local/state/vim/backup//
set directory=~/.local/state/vim/swap//
set undodir=~/.local/stata/vim/undo//


set scrolloff=8
set backspace=indent,eol,start
set matchpairs+=<:>
runtime! macros/matchit.vim

nnoremap j gj
nnoremap k gk

set hidden
set ttyfast
set laststatus=2
set showmode
set showcmd

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>

"inoremap <F1> <ESC>:set invfullscreen<cr>a 
"nnoremap <F1> :set invfullscreen<cr> 
"vnoremap <F1> :set invfullscreen<cr>

" formatting
map <leader>q gqip

set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<cr> " Toggle listchars

set t_Co=256
set background=dark


