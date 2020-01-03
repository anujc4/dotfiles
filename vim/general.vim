" REFERENCE: Overview of which map command works in which mode.
"      COMMANDS            |      MODES ~
" :map   :noremap  :unmap  | Normal, Visual, Select, Operator-pending
" :nmap  :nnoremap :nunmap | Normal
" :vmap  :vnoremap :vunmap | Visual and Select
" :smap  :snoremap :sunmap | Select
" :xmap  :xnoremap :xunmap | Visual
" :omap  :onoremap :ounmap | Operator-pending
" :map!  :noremap! :unmap! | Insert and Command-line
" :imap  :inoremap :iunmap | Insert
" :lmap  :lnoremap :lunmap | Insert, Command-line, Lang-Arg
" :cmap  :cnoremap :cunmap | Command-line

" Auto-reload buffers when files are changed on disk
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

set visualbell                  " Use visual bell instead of beeping when doing something wrong
set t_vb=                       " Reset the terminal code for the visual bell.
set clipboard=unnamed           " Clipboard sharing

let mapleader = ","

nmap <leader>w :w!<cr>          " Fast saving
nmap <leader>q :q!<cr>          " Fast quitting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the color theme
colorscheme gruvbox
let g:gruvbox_contrast_light = 'medium'

set hidden
set wildmenu " Better command-line completion
set wildmode=longest:list,full

" Replace tabs with spaces
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs

" Improve Searching
set hlsearch                    " highlight the search
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=0                 " keep a 5 line padding when moving the cursor
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth
set linebreak                   " break lines at word end
set number relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map Y y$                        " Map Y to copy line. Same as yy
set wrap                        " Enable line wrapping.
set ruler                       " Always show cursor position.

set guifont=Hack_Nerd_Font:h11

" press Ctrl-Left or Ctrl-Right to go to the previous or next tabs
nnoremap <C-{> :tabprevious<CR>
nnoremap <C-}> :tabnext<CR>

"changes cursor shape according to active mode
let &t_SI = "\[6 q"
let &t_SR = "\[4 q"
let &t_EI = "\[2 q"

" Enable colors in vim
set termguicolors

" Scroll 25 lines up or down using Control keys
noremap <C-Down> 25j
noremap <C-Up> 25k

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif