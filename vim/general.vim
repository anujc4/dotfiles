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
set clipboard=unnamedplus       " Clipboard sharing
set nrformats-=octal            " Don't use octal numbers

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

" always highlight TBD TODO and FIXME no matter the filetype
highlight link CustomHighlight_Warning Todo
autocmd WinEnter,VimEnter * :silent! call matchadd('CustomHighlight_Warning', 'TBD\|TODO\|FIXME', -1)

runtime macros/matchit.vim
" :DoMatchParen

map <End> g$
imap <End> <c-o>g$
map <Home> g^
imap <Home> <c-o>g^

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

" clipboard
map <Leader>p "+gp
vmap <Leader>y "+y
map <Leader>y "+yy

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc

nmap <silent><leader>m :call ToggleMouse()<CR>

fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" nmap <C-[> :tabprevious<CR>
" nmap <C-]> :tabnext<CR>