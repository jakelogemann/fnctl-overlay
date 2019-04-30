" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window

function! Redir(buf_cmd, cmd)

	for winId in range(1, winnr('$'))
		if getwinvar(winId, 'scratch')
			silent! execute winId . 'windo close'
		endif
	endfor

	for bufId in range(1, bufnr('$'))
		if getbufvar(bufId, 'scratch')
			silent! execute bufId . 'bufdo close'
		endif
	endfor

	if a:cmd =~ '^!'
		execute "let output = system('" . substitute(a:cmd, '^!', "", "") . "')"
	else
		redir => output
		execute a:cmd
		redir END
	endif

  execute a:buf_cmd
	let w:scratch = 1
	let b:scratch = 1
  setlocal nobuflisted buftype=nofile noswapfile
  setlocal bufhidden=wipe 
  setlocal number norelativenumber

  " Append the output (starting from the first character of the buffer). Then
  " lock the buffer as readonly so that it doesn't get accidentally cleared.
	call setline(1, split(output, "\n"))
  setlocal readonly nomodifiable nomodified
endfunction

command! -nargs=1 -complete=command Redir       silent call Redir('enew',   <f-args>)
command! -nargs=1 -complete=command RedirV      silent call Redir('vnew',   <f-args>)
command! -nargs=1 -complete=command RedirToTab  silent call Redir('tabnew', <f-args>)
