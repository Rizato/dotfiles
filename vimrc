set nocompatible

" Color detection on my terminal doesn't seem to work
set t_Co=256
colo wombat

set ttyfast
set mouse=a

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

set textwidth=80
autocmd FileType markdown,plaintex,text set formatoptions+=t

set wildmenu
set wildmode=list:longest

set number

" Make needs hard tabs
autocmd FileType make setlocal noexpandtab

call pathogen#infect()
call pathogen#helptags()

" Start NERDTree automatically, focus main window if file was passed on the
" command line
function! StartNERDTree()
    NERDTree
    if 0 != argc()
        wincmd p
    end    
endfunction
autocmd VimEnter * call StartNERDTree()
map <C-n> :NERDTreeToggle<CR>

map <C-t> :TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapCTabSwitchBufs=1

set tags=./tags;/

set completeopt=menu,menuone,longest
set pumheight=15
let g:SuperTabDefaultCompletionType="context"
let g:clang_complete_copen=1

nmap <buffer> <silent> <leader>FS :FSSplitRight<cr>

" Fix protodef
let g:protodefprotogetter=expand("<sfile>:p:h")."/.vim/bundle/ProtoDef/pullproto.pl"
let g:disable_protodef_sorting=1

