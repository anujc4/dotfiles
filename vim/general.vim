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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme material
" let g:material_theme_style = 'default'
" let g:airline_theme = 'material'

" " For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
" if (has('nvim'))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" endif

" " For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" " Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" " https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

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

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc

nmap <leader>m :call ToggleMouse()<CR>


" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
map <C-]> :bnext<CR>

" Move to the previous buffer
map <C-[> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
map <C-w> :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Fast saving
nmap <leader>w :write<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :write <BAR> bd #<CR>

" Helper function to check the performance of vim
command! ProfileMe :profile start profile.log <bar> profile func * <bar> profile file *
command! ProfileStop :profile pause

" Gruvbox theme settings
autocmd vimenter * ++nested colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
