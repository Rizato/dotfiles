set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'dsolstad/vim-wombat256i'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'wting/rust.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'jnwhiteh/vim-golang'
Plugin 'heartsentwined/vim-emblem'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lervag/vim-latex'

call vundle#end()

syntax on
filetype plugin indent on

set t_Co=256
colo wombat256i

set hlsearch
set incsearch
set cursorline

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=80
set formatoptions-=t
autocmd FileType markdown,tex,text setl fo+=t
autocmd FileType markdown,tex,text setl spell

set wildmenu
set wildmode=list:longest

set number

set hidden
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprev<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" make needs hard tabs
autocmd FileType make setl noet

" javascript options
autocmd FileType html setl ts=2 sts=2 sw=2
autocmd FileType javascript setl ts=2 sts=2 sw=2
autocmd FileType coffee setl ts=2 sts=2 sw=2
hi link coffeeSpaceError NONE
nnoremap <leader>cc :CoffeeCompile %<CR>

" golang options
autocmd FileType go setl noet
autocmd FileType go autocmd BufWritePre <buffer> silent Fmt
let go_highlight_trailing_whitespace_error=0

" latex options
let g:tex_flavor="latex"
autocmd FileType tex normal zR

" nerdtree options
noremap <C-n> :NERDTreeToggle<CR>

" easymotion options
nmap <Leader> <Plug>(easymotion-prefix)

" airline options
let g:airline_powerline_fonts=1

" ctrlp options, see http://blog.patspam.com/2014/super-fast-ctrlp
let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func={'match' : 'matcher#cmatch' }
let g:ctrlp_max_files=0

set tags=./tags;/

