if has('folding') " {{{
  function! NeatFoldText() "{{{
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', "", 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1

    let foldchar = matchstr(&fillchars, 'fold:\zs.')

    let foldtextstart = strpart('»' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = '| ' . printf("%10s", lines_count . ' lines') . ' |' . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  endfunction " }}}

  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=1
  set foldlevel=1
  set nofoldenable
  set foldtext=NeatFoldText()

  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:\             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
endif " }}}
