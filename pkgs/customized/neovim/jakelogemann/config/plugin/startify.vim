function! s:startify_list_commits()
  let git = 'git'
  let commits = systemlist(git .' log --oneline | head -n5')
  let git = 'G'. git[1:]
  return map(commits, '{"line": "\"". matchstr(v:val, "\\s\\zs.*") . "\"", "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

function! s:myStartifyHook()
  " silent NERDTreeTabsOpen
  let &l:stl = printf('Welcome back, %s!', $USER)
endfunction
autocmd User Startified call s:myStartifyHook()

" Sort sessions by modification time (when the session files were written)
" rather than alphabetically.
let g:startify_session_sort = 0

let g:startify_session_dir=g:dotfiles.dirs.sessions
let g:startify_relative_path = 1
let g:startify_enable_special = 0
let g:startify_padding_left = 2

let g:startify_bookmarks = [
    \ { 'o': '/etc/nixos/' }, 
    \ {'z': '~/.zshrc' }
    \ ]

let g:startify_lists = [
    \ { 'type': 'dir',       
    \   'header': ['MRU '. getcwd()]},
    \ { 'type': 'sessions',
    \   'header': ['Sessions']},
    \ { 'type': 'bookmarks', 
    \   'header': ['Bookmarks']},
    \ { 'type': 'commands',  
    \   'header': ['Commands']},
    \ { 'type': function('s:startify_list_commits'), 
    \   'header': ['Git Commits']},
    \ ]

let g:startify_custom_header = [
\ '   ____  _       _____                _                _      ',
\ '  |  _ \(_)     |  __ \              | |              (_)     ',
\ '  | |_) |_  ___ | |__) |_ _ _ __   __| | ___ _ __ ___  _  ___ ',
\ '  |  _ <| |/ _ \|  ___/ _` | "_ \ / _` |/ _ \ "_ ` _ \| |/ __|',
\ '  | |_) | | (_) | |  | (_| | | | | (_| |  __/ | | | | | | (__ ',
\ '  |____/|_|\___/|_|   \__,_|_| |_|\__,_|\___|_| |_| |_|_|\___|',
\ '   ---------------------------------------------------------- ',
\ ]

