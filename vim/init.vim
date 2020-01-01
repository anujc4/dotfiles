set nocompatible
set encoding=UTF-8
syntax on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" Plug 'easymotion/vim-easymotion'
" Plug 'junegunn/vim-easy-align'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Language specific plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/bash-support.vim'

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/plugin_config.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/go.vim
