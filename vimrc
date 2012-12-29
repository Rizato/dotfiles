set nocompatible
syntax on

set t_Co=256
colo wombat

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

call pathogen#infect()
call pathogen#helptags()

autocmd FileType make setlocal noexpandtab

