" Auto-reload buffers when files are changed on disk
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

set visualbell                  " Use visual bell instead of beeping when doing something wrong
set t_vb=                       " Reset the terminal code for the visual bell.
set mouse=a                     " Enable use of the mouse for all modes

let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Height of the command bar
set cmdheight=2

set hidden
set wildmenu " Better command-line completion

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

" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" press Ctrl-Left or Ctrl-Right to go to the previous or next tabs
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>