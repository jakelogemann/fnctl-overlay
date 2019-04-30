"..........................................................."
".   .d8888b.           888                                ."
".  d88P  Y88b          888                                ."
".  888    888          888                                ."
".  888         .d88b.  888  8888b.  88888b.   .d88b.      ."
".  888  88888 d88""88b 888     "88b 888 "88b d88P"88b     ."
".  888    888 888  888 888 .d888888 888  888 888  888     ."
".  Y88b  d88P Y88..88P 888 888  888 888  888 Y88b 888     ."
".   "Y8888P88  "Y88P"  888 "Y888888 888  888  "Y88888     ."
".   --------------------------------------------- 888     ."
".                                            Y8b d88P     ."
".                                             "Y88P"      ."
"..........................................................."
" Go Custom Vim Configuration
" :TagbarOpen

let g:go_def_reuse_buffer = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_fmt_fail_silently = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_list_height = 0
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_snippet_engine = "automatic"
let g:go_template_autocreate = 0

nnoremap <silent> gd    :GoDef<cr>
nnoremap <silent> gu    :GoDefStack 1<cr>

nnoremap <silent> <LocalLeader>ff     :GoFmt<cr>
nnoremap <silent> <LocalLeader><bs>   :GoDefStack<cr>
nnoremap <silent> <LocalLeader>dd     :GoDoc<cr>
nnoremap <silent> <LocalLeader>bb     :GoBuild<cr>
nnoremap <silent> <LocalLeader>gg     :GoGenerate<cr>
nnoremap <silent> <LocalLeader>tt     :TagbarToggle<cr>

setl nolist
setl foldlevel=1 nofoldenable

augroup my_ftplugin_go
  autocmd!
"  autocmd BufEnter,BufWritePost    <buffer> TagbarOpen
"  autocmd InsertLeave,FocusGained  <buffer> TagbarOpen
"  autocmd InsertEnter,FocusLost    <buffer> TagbarClose
augroup END
