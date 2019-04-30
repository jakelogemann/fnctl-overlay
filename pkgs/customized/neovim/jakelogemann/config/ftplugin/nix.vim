autocmd User anyfoldLoaded normal zv

setlocal foldlevel=0
let b:anyfold_activate = 1
let b:anyfold_fold_comments = 1
let b:anyfold_fold_toplevel = 1
let b:anyfold_identify_comments = 2

" function! NixFoldText()
"   let foldsize = (v:foldend-v:foldstart)
"   return getline(v:foldstart).' ('.foldsize.' lines)'
" endfunction
" setlocal foldtext=NixFoldText()

let b:my_localleader_guide = {
      \ 'normal': {
      \   'name': 'Nix Local Leader',
      \   'r': ['call fnctl#nix#repl()', 'Nix REPL'],
      \   'R': ['!fnctl rebuild', 'Rebuild (FnCtl)'],
      \   'i': ['!nix-env -f % -i', 'Nix: Install Buffer'],
      \   'u': ['!nix-env -f % -i', 'Nix: Upgrade Buffer'],
      \   'e': ['!nix-env -f % -e', 'Nix: Erase Buffer'],
      \   'f': {
      \     'name': 'Find in NIX_PATH',
      \     'p': ['echo "NOT IMPLEMENTED"', 'Find in <nixpkgs>'],
      \     'c': ['echo "NOT IMPLEMENTED"', 'Find in <nixos-config>'],
      \     'h': ['echo "NOT IMPLEMENTED"', 'Find in <nix-home>'],
      \     'f': ['echo "NOT IMPLEMENTED"', 'Find in <fnctl>'],
      \     'l': ['echo "NOT IMPLEMENTED"', 'Find in <nixpkgs/lib>']
      \     }
      \   },
      \ 'visual': {
      \   '=': ['Tabularize assignment', 'Align: assignment'],
      \   ';': ['TCommentAs javascript_block', 'Comment Block']
      \   }
      \ }

autocmd BufWritePre <buffer> call fnctl#textutils#trim_whitespace()
