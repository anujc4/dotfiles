" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" automatically auto-format code and add missing imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')