set signcolumn=no
set guicursor=
set showmode
set showcmd
set relativenumber

set history=50
set nowrap

set sidescrolloff=8
set scrolloff=8

set smartindent
set autoindent

set expandtab
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase

set noswapfile
set nobackup

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif

set undodir=~/.vim/undodir
set undofile

set updatetime=50
set colorcolumn=80

set completeopt=menuone,noselect
set clipboard^=unnamed,unnamedplus

noremap <Space> <Nop>
let g:mapleader = ' '

noremap ' `
vnoremap <Leader>p "_dP
vnoremap <Leader>d "_d
nnoremap <Leader>d "_d

nnoremap <Leader>nh :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
