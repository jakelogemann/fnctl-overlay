let g:neomake_ft_test_maker_buffer_output = 0
let g:neomake_open_list = 1
let g:neomake_serialize = 1
let g:neomake_echo_current_error = 0
let g:neomake_serialize_abort_on_error = 1
let g:neomake_list_height = 20

let g:airline#extensions#neomake#enabled = 1
let g:neomake_error_sign   = {'text': '✖','texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚠','texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤','texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ','texthl': 'NeomakeInfoSign'}

function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code != 0
    echom printf('The job for maker %s exited non-zero: %s',
    \ context.jobinfo.maker.name, context.jobinfo.exit_code)
  else
    echom printf('The job for maker %s exited OK!',
    \ context.jobinfo.maker.name)
  endif
endfunction

augroup my_neomake_hooks
    au!
    autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
augroup END

let g:neomake_make_maker = {
 \ 'exe': 'make',
 \ 'args': [],
 \ 'append_file': 0,
 \ 'errorformat': '%f:%l:%c: %m',
 \ }

let g:neomake_make_install_maker = {
 \ 'exe': 'make',
 \ 'args': ['install'],
 \ 'append_file': 0,
 \ 'errorformat': '%f:%l:%c: %m',
 \ }

let g:neomake_make_build_maker = {
 \ 'exe': 'make',
 \ 'args': ['build'],
 \ 'append_file': 0,
 \ 'errorformat': '%f:%l:%c: %m',
 \ }

let g:neomake_cargo_run_maker = {
 \ 'exe': 'cargo',
 \ 'args': ['run'],
 \ 'append_file': 0,
 \ 'errorformat': '%f:%l:%c: %m',
 \ }
