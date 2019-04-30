function! fnctl#textutils#trim_whitespace()
  let l:old_pos = winsaveview()
  %s/\s\+$//e
  retab
  call winrestview(l:old_pos)
endfunction
