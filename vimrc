set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'mbbill/code_complete'
Bundle 'Rip-Rip/clang_complete'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-markdown'
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'scrooloose/syntastic'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'vim-scripts/ProtoDef'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on

" Color detection on my terminal doesn't seem to work
set t_Co=256
colo wombat

set ttyfast
set mouse=a

syntax on
set ofu=syntaxcomplete#Complete

set hlsearch
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=80
set formatoptions-=t
autocmd FileType markdown,plaintex,text set formatoptions+=t

set wildmenu
set wildmode=list:longest

set number

" Make needs hard tabs
autocmd FileType make setlocal noexpandtab

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
let g:miniBufExplUseSingleClick=1
let g:miniBufExplModSelTarget=1

set tags=./tags;/

set completeopt=menu,menuone,longest
set pumheight=15
let g:SuperTabDefaultCompletionType="context"
let g:clang_complete_copen=1

nmap <buffer> <silent> <leader>FS :FSSplitRight<cr>

" Fix protodef
let g:protodefprotogetter=expand("<sfile>:p:h")."/.vim/bundle/ProtoDef/pullproto.pl"
let g:disable_protodef_sorting=1

" Code complete template defs
let g:template={}
let g:template['c']={}
let g:template['c']['de']="#define "
let g:template['c']['in']="#include \"\"\<left>"
let g:template['c']['is']="#include <>\<left>"
let g:template['c']['ff']="#ifndef \<c-r>=GetFileName()_\<cr>\<CR>#define \<c-r>=GetFileName()_\<cr>".
            \repeat("\<cr>",4)."#endif /* \<c-r>=GetFileName()_\<cr> */".repeat("\<up>",2)
 
