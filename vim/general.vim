" Auto-reload buffers when files are changed on disk
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Reset the terminal code for the visual bell.
set t_vb=

" Clipboard sharing
set clipboard=unnamedplus

" Don't use octal numbers
set nrformats-=octal

let mapleader = " "

nmap <leader>w :w!<cr>          " Fast saving
nmap <leader>q :q!<cr>          " Fast quitting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the color theme
colorscheme gruvbox
let g:gruvbox_contrast_light = 'medium'

" Better command-line completion
set wildmenu

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

set splitbelow                  " splits open below the current window
set splitright                  " splits open to the right of the current window
set hlsearch!                   "
set hidden                      " if hidden is not set, TextEdit might fail.
set nobackup                    " Some servers have issues with backup files, see #649
set nowritebackup               "
set cmdheight=2                 " Better display for messages
set updatetime=50               " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c                " don't give |ins-completion-menu| messages.
set signcolumn=yes              " always show signcolumns

set wrap                        " Enable line wrapping.
set ruler                       " Always show cursor position.

set termguicolors " Enable colors in vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guifont=Hack_Nerd_Font:h11

"changes cursor shape according to active mode
let &t_SI = "\[6 q"
let &t_SR = "\[4 q"
let &t_EI = "\[2 q"


" Scroll 25 lines up or down using Control keys
noremap <C-Down> 25j
noremap <C-Up> 25k

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" icrementally increase a number inside ctrl v boxes
function! Increment()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Increment()<CR>

" icrementally increase a number inside ctrl v boxes
function! Decrement()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-x>"
  endif
  normal `<
endfunction
vnoremap <C-x> :call Decrement()<CR>

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc

nmap <leader>m :call ToggleMouse()<CR>
