" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
"  My VIMRC
"
" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
"set undodir=~/.vim/undo-dir//
"set undofile
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
"set backup
"set backupdir=~/.backup//
set updatetime=300
set redrawtime=10000
syntax on


" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
" Plugins 
"
" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/vim-z80.vim
call plug#end()
doautocmd User PlugLoaded

