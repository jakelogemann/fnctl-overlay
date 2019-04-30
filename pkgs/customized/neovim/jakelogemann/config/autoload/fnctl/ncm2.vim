function! fnctl#ncm2#init()
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c

  inoremap                 <c-c>   <ESC>
  inoremap <expr>          <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr>          <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <silent> <expr> <CR>    ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))
  " c-j c-k for moving in snippet
  imap <expr>              <c-u>   ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
  smap                     <c-u>   <Plug>(ultisnips_expand)

  let g:UltiSnipsExpandTrigger    = "<Plug>(ultisnips_expand)"
  let g:UltiSnipsJumpForwardTrigger = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
  let g:UltiSnipsRemoveSelectModeMappings = 1
  let g:UltiSnipsEditSplit = 'context'
  let g:UltiSnipsSnippetsDir = g:dotfiles.dirs.snippets
  let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

  augroup NCM2_user_hooks
    au!
    au User Ncm2PopupOpen   set completeopt=noinsert,menuone,noselect
    au User Ncm2PopupClose  set completeopt=menuone
    au BufEnter *           call ncm2#enable_for_buffer()
  augroup END

  " Fixes Multiple Cursors plugin (disables autocomplete).
  function! Multiple_cursors_before()
    call ncm2#lock('vim-multiple-cursors')
  endfunction

  function! Multiple_cursors_after()
    call ncm2#unlock('vim-multiple-cursors')
  endfunction
endfunction
