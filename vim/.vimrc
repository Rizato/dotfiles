call plug#begin()

Plug 'Chiel92/vim-autoformat'
Plug 'Lokaltog/vim-easymotion'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dsolstad/vim-wombat256i'
Plug 'embear/vim-localvimrc'
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vim-latex'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'ruanyl/vim-fixmyjs'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-markdown'
Plug 'vim-syntastic/syntastic'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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
autocmd FileType markdown,tex,text setl spell nowrap

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
nnoremap <silent> <C-e> :wincmd v<cr>
nnoremap <silent> <C-q> :wincmd n<cr>
nnoremap <silent> <C-w> :wincmd q<cr>
nnoremap <silent> th :tabfirst<cr>
nnoremap <silent> tj :tabnext<cr>
nnoremap <silent> tk :tabprev<cr>
nnoremap <silent> tl :tablast<cr>
nnoremap <silent> tn :tabnew<cr>
nnoremap <silent> td :tabclose<cr>

nnoremap <leader>f :Autoformat<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" LanguageClient-Neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ 'go': ['go-langserver']}

noremap <silent> ` :call LanguageClient_contextMenu()<cr>
noremap <silent> H :call LanguageClient_textDocument_hover()<cr>
noremap <silent> Z :call LanguageClient_textDocument_definition()<cr>
noremap <silent> R :call LanguageClient_textDocument_rename()<cr>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<cr>

" make needs hard tabs
autocmd FileType make setl noet

" yaml options
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

" javascript options
autocmd FileType html,javascript setl ts=2 sts=2 sw=2
autocmd FileType javascript nnoremap <buffer><leader>f :<C-u>Fixmyjs<cr>

" golang options
autocmd FileType go setl noet
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" rust options
autocmd FileType rust nnoremap <buffer><leader>f :<C-u>RustFmt<cr>
"let g:syntastic_rust_rustc_exe = 'cargo check'
"let g:syntastic_rust_rustc_fname = ''
"let g:syntastic_rust_rustc_args = '--'
"let g:syntastic_rust_checkers = ['rustc']

" python options
autocmd FileType python nnoremap <buffer><leader>f :<C-u>YAPF<cr>
let g:syntastic_python_checkers = ['flake8']

" solidity options
let g:syntastic_solidity_checkers = ['solium']

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

autocmd FileType c,cpp,objc nnoremap <buffer><leader>f :<C-u>ClangFormat<cr>

set tags=./tags;/

