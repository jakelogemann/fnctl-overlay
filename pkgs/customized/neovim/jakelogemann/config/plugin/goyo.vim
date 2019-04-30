function! s:goyo_enter()
  nnoremap <silent> <F10> :Goyo!<cr>
  nnoremap <silent> <Space><Space> :Limelight<cr>
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nofoldenable
  set nowrap
  set nonumber norelativenumber
endfunction

function! s:goyo_leave()
  nnoremap <silent> <F10> :Goyo<cr>
  nnoremap <silent> <Space><Space> <nop>
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set foldenable
  set wrap
  set number norelativenumber
  silent Limelight!
endfunction

let g:goyo_width  = '80%'
let g:goyo_height = '100%'

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'DarkGray'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <silent> <F10>      :Goyo<cr>
