set nocompatible
set encoding=UTF-8
syntax on
set updatetime=100

" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'                               " Because it is sensible

Plug 'airblade/vim-gitgutter'                           " Show git changes in sidebar
Plug 'ctrlpvim/ctrlp.vim'                               " Open files inside project
Plug 'easymotion/vim-easymotion'                        " Navigate inside files
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'                           " Select next word
Plug 'mhinz/vim-startify'                               " Start screen for vim
Plug 'mileszs/ack.vim'                                  " To search inside files
Plug 'kaicataldo/material.vim'                          " Theme
Plug 'nathanaelkane/vim-indent-guides'                  " Show indentation guides
Plug 'ntpeters/vim-better-whitespace'                   " Show trailing whitespaces
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'                           " File icons inside NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Sidebar to show files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'                               " Git tool
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'                      " Show files changes inside NERDTree

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/plugin_config.vim

