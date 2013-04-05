set nocompatible

set t_Co=256
colo wombat

syntax on
filetype indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

set hlsearch
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd FileType make setlocal noexpandtab

call pathogen#infect()
call pathogen#helptags()

autocmd vimenter * NERDTree | wincmd p
map <C-n> :NERDTreeToggle<CR>

map <C-t> :TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim = 1

set tags=./tags;/

set completeopt=menu,menuone,longest
set pumheight=15
let g:SuperTabDefaultCompletionType="context"
let g:clang_complete_copen=1

