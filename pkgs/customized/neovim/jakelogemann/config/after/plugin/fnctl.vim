let mapleader = '<Space>'
let maplocalleader = ','

let g:which_key_leader_map = { 'name': 'leader' }
let g:which_key_leader_map.b = {
      \ 'name': '+buffer',
      \ 'd':    ['bd', 'delete-buffer'],
      \ 'f':    ['bfirst', 'first-buffer'],
      \ 'h':    ['Startify', 'home-buffer'],
      \ 'l':    ['blast', 'last-buffer'],
      \ 'n':    ['bnext', 'next-buffer'],
      \ 'p':    ['bprevious', 'previous-buffer'],
      \ '?':    ['Buffers', 'fzf-buffer'],
      \ }

let g:which_key_localleader_map = { 'name': 'localleader' }
let g:which_key_localleader_map.b = {
      \ 'name': '+build',
      \ 'b':    ['echo "Not Implemented!"', 'default-build'],
      \ }

call which_key#register(',', "g:which_key_localleader_map")
call which_key#register(' ', "g:which_key_leader_map")

nnoremap <leader>       :<C-u>WhichKey ' '<CR>
vnoremap <leader>       :<C-u>WhichKeyVisual ' '<CR>
nnoremap <localleader>  :<C-u>WhichKey ','<CR>
vnoremap <localleader>  :<C-u>WhichKeyVisual ','<CR>

autocmd! FileType which_key
autocmd  FileType which_key
      \ set laststatus=0 noshowmode noruler
      \  |  autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Manually update the maps.
call which_key#parse_mappings()
