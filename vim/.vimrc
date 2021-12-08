" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
"  My VIMRC
"
" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
"set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undodir=~/.vim/undo-dir//
set undofile
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
set backup
set backupdir=~/.backup//
set updatetime=300
set redrawtime=10000
syntax on


" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
" Plugins 
"
" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins/airline.vim
call plug#end()



let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

set noshowmode
