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
"""""""""""""""""""""""COC.NVIM"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <C-I> :Format<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1

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