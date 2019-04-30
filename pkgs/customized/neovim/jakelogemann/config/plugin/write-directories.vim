" Use :W to create a file and its parent directories:
" Source: https://vi.stackexchange.com/a/11789 
 
function! s:WriteCreatingDirs()
  let l:file=expand("%")
  if empty(getbufvar(bufname("%"), '&buftype')) && l:file !~# '\v^\w+\:\/'
    let dir=fnamemodify(l:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
  write
endfunction

command! W call s:WriteCreatingDirs()
