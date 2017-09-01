call plug#begin()
Plug 'dsolstad/vim-wombat256i'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'embear/vim-localvimrc'
Plug 'lervag/vim-latex'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'nono/vim-handlebars'
Plug 'heartsentwined/vim-emblem'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bogado/file-line'
Plug 'Chiel92/vim-autoformat'
Plug 'cespare/vim-toml'
Plug 'rhysd/vim-clang-format'
Plug 'cstrahan/vim-capnp'
Plug 'tomlion/vim-solidity'
call plug#end()

syntax on
filetype plugin indent on
set cino=N-s

if has("unix")
    set t_Co=256
    colo wombat256i
    hi TabLine guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
    hi TabLineSel guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=235 cterm=bold
    hi TabLineFill guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
endif

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
nnoremap <silent> <Right> :bnext<cr>
nnoremap <silent> <Left> :bprev<cr>
nnoremap <silent> <C-k> :wincmd k<cr>
nnoremap <silent> <C-j> :wincmd j<cr>
nnoremap <silent> <C-h> :wincmd h<cr>
nnoremap <silent> <C-l> :wincmd l<cr>
nnoremap <silent> th :tabfirst<cr>
nnoremap <silent> tj :tabnext<cr>
nnoremap <silent> tk :tabprev<cr>
nnoremap <silent> tl :tablast<cr>
nnoremap <silent> tn :tabnew<cr>
nnoremap <silent> td :tabclose<cr>

nnoremap <leader>f :Autoformat<cr>

" make needs hard tabs
autocmd FileType make setl noet

" javascript options
autocmd FileType html,javascript,coffee,handlebars.html setl ts=2 sts=2 sw=2
hi link coffeeSpaceError NONE
nnoremap <leader>cc :CoffeeCompile %<cr>

" golang options
autocmd FileType go setl noet
autocmd FileType go autocmd BufWritePre <buffer> silent :GoFmt

" rust options
let g:rustfmt_command="rustup run nightly rustfmt"
autocmd FileType rust nnoremap <buffer><leader>cf :<C-u>RustFmt<cr>

" latex options
let g:tex_flavor="latex"
autocmd FileType tex normal zR

" nerdtree options
noremap <C-n> :NERDTreeToggle<cr>

" easymotion options
nmap <Leader> <Plug>(easymotion-prefix)

" airline options
let g:airline_powerline_fonts=1

" localvimrc options
let g:localvimrc_persistent=1

" clang format options
let g:clang_format#style_options = {
    \ "Standard": "C++11",
    \ "BasedOnStyle": "Webkit",
    \ "AllowShortFunctionsOnASingleLine": "Empty",
    \ "AlwaysBreakTemplateDeclarations": "true",
    \ "BreakBeforeTernaryOperators": "false",
    \ "ColumnLimit": 120,
    \ "ConstructorInitializerIndentWidth": 2,
    \ "NamespaceIndentation": "None"}

autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<cr>

set tags=./tags;/

