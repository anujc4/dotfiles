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
Plug 'jiangmiao/auto-pairs'                             " Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'mg979/vim-visual-multi'                           " Select next word
Plug 'mhinz/vim-startify'                               " Start screen for vim
Plug 'mileszs/ack.vim'                                  " To search inside files
Plug 'nathanaelkane/vim-indent-guides'                  " Show indentation guides
Plug 'ntpeters/vim-better-whitespace'                   " Show trailing whitespaces
Plug 'preservim/nerdcommenter'                          " Vim plugin for intensely nerdy commenting powers
Plug 'ryanoasis/vim-devicons'                           " File icons inside NERDTree
Plug 'preservim/nerdtree'                               " Sidebar to show files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " Extra syntax and highlight for nerdtree files
Plug 'tpope/vim-fugitive'                               " Git tool
Plug 'vim-airline/vim-airline'                          " lean & mean status/tabline for vim
Plug 'Xuyuanp/nerdtree-git-plugin'                      " Show files changes inside NERDTree
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Nodejs extension host for vim & neovim
call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/plugin_config.vim
