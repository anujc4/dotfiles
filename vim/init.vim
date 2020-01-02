set nocompatible
set encoding=UTF-8
syntax on
set updatetime=100

" Autoinstall vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

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
Plug 'zivyangll/git-blame.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rhysd/git-messenger.vim'
Plug 'SirVer/ultisnips'

" Language specific plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/bash-support.vim'

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/plugin_config.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/go.vim
