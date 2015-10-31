call plug#begin()
Plug 'dsolstad/vim-wombat256i'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'jnwhiteh/vim-golang'
Plug 'heartsentwined/vim-emblem'
Plug 'kchmck/vim-coffee-script'
Plug 'lervag/vim-latex'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

syntax on
filetype plugin indent on
set cino=N-s

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
autocmd FileType markdown,tex,text setl spell nowrap fo+=t

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
autocmd FileType html,javascript,coffee setl ts=2 sts=2 sw=2
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

" localvimrc options, sandbox doesn't seem to work
let g:localvimrc_sandbox=0
let g:localvimrc_persistent=1

set tags=./tags;/

