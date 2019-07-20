" init.vim
" Author: Pierre Jackman
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set hidden
set cmdheight=2
set updatetime=300
" Always show gutter
set signcolumn=yes

" Always show tabs
set showtabline=2

syntax on
filetype plugin indent on

" Disable Python2 support
let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/bin/python'

" Spacebar is leader
let mapleader = "\<Space>"

" Load Plugins
execute 'source' '$HOME/.config/nvim/vimrc/plugins.vim'
" Interface configuration
execute 'source' '$HOME/.config/nvim/vimrc/theme.vim'
" Load up general utilities
execute 'source' '$HOME/.config/nvim/vimrc/general.vim'
" Setup keyboard bindings
execute 'source' '$HOME/.config/nvim/vimrc/bindings.vim'
