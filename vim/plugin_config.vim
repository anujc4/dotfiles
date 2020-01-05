" Close nvim if it is the only window available
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree with Control-N
map <C-n> :NERDTreeToggle<CR>

" Refresh NERDTree and CtrlP
nmap <Leader>nr :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>
nmap <Leader>n :NERDTreeToggle<CR>

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Pressing Leader with ga(git annotate) opens/closes annotate window
nnoremap <silent><leader>ga :call GitAnnotateToggle()<cr>

" Function to handle toggle
let s:annotate_is_open = 0
function! GitAnnotateToggle()
    if s:annotate_is_open
        :q
        let s:annotate_is_open = 0
    else
        :Gblame
        let s:annotate_is_open = 1
    endif
endfunction

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
map <leader>e :bufdo e!<CR>                    " reload files in buffer
" set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" ACK """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>/ :Ack!<Space>

" fall back to Ack in case you use your vimrc on a system without Ag available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:UltiSnipsExpandTrigger="<tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" ALE """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
\   'proto': ['prototool-lint'],
\}
let g:ale_lint_on_text_changed = 'never'

" <leader>f will format and fix your current file.
" Change to PrototoolFormat to only format and not fix.
nnoremap <silent> <leader>pf :call PrototoolFormatFix()<CR>

" indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""VIM MULTI CURSOR"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'