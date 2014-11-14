set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'dsolstad/vim-wombat256i'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-markdown'
Bundle 'pangloss/vim-javascript'
Bundle 'derekwyatt/vim-scala'
Bundle 'jnwhiteh/vim-golang'
Bundle 'heartsentwined/vim-emblem'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on

colo wombat256i

syntax on

set hlsearch
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=80
set formatoptions-=t
autocmd FileType markdown,plaintex,text setl fo+=t

set wildmenu
set wildmode=list:longest

set number

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" make needs hard tabs
autocmd FileType make setl noet

" golang options
autocmd FileType go setl noet
autocmd FileType go autocmd BufWritePre <buffer> silent Fmt
let go_highlight_trailing_whitespace_error=0

" javascript options
autocmd FileType html setl ts=2 sts=2 sw=2
autocmd FileType javascript setl ts=2 sts=2 sw=2
autocmd FileType coffee setl ts=2 sts=2 sw=2
hi link coffeeSpaceError NONE

map <C-t> :TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplUseSingleClick=1
let g:miniBufExplModSelTarget=1

set tags=./tags;/

