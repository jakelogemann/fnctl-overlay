function! fnctl#nix#repl()
  tabnew
  silent! terminal nix repl '<nixpkgs/nixos>'
  normal i
endfunction

function! fnctl#nix#eval(expr)
  let l:output = system(printf("nix-instantiate --eval --readonly-mode --expr '%s'", a:expr))
  return substitute(l:output, "\n", "", "")
endfunction

function! fnctl#nix#eval_unsafe(expr)
  let l:output = system(printf("nix-instantiate --eval --read-write-mode --expr '%s'", a:expr))
  return substitute(l:output, "\n", "", "")
endfunction

function! fnctl#nix#search_nix_path(pname)
  let l:path = g:fnctl#nix#paths[a:pname]
  execute printf("Denite -path=%s -buffer-name=%s file_rec", l:path, a:pname)
endfunction

function! fnctl#nix#search_fnctlpkgs()
  return fnctl#nix#search_nix_path(g:fnctl#nix#paths['nixpkgs-fnctl'])
endfunction

function! fnctl#nix#inject()
  if exists('g:fnctl#nix#nixpkgs') | return | endif
  let g:fnctl#nix#paths = {
        \ 'nixos-config':   fnctl#nix#eval('<nixos-config>'),
        \ 'nixpkgs':        fnctl#nix#eval('<nixpkgs>'),
        \ 'nixpkgs-nixpkgs':   fnctl#nix#eval('<nixpkgs/pkgs>'),
        \ 'nixos':          fnctl#nix#eval('<nixpkgs/nixos>'),
        \ 'fnctl':          fnctl#nix#eval('<fnctl>'),
        \ 'nixpkgs-fnctl':  fnctl#nix#eval('<nixpkgs-fnctl>'),
        \ }

  command! -nargs=0 SearchNixOSConfig  call fnctl#nix#search_nix_path('nixos-config')
  command! -nargs=0 SearchNixOS        call fnctl#nix#search_nix_path('nixos')
  command! -nargs=0 SearchNixPkgs      call fnctl#nix#search_nix_path('nixpkgs-nixpkgs')
  command! -nargs=0 SearchFnCtlPkgs    call fnctl#nix#search_nix_path('nixpkgs-fnctl')
  command! -nargs=0 SearchFnCtl        call fnctl#nix#search_nix_path('fnctl')
endfunction
