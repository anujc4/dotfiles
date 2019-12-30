set nocompatible
set encoding=UTF-8
syntax on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vim-easy-align'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
" Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Language specific plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/bash-support.vim'
h

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/plugin_config.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/go.vim
