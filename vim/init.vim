set nocompatible
set encoding=UTF-8
syntax on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language specific plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/plugin_config.vim