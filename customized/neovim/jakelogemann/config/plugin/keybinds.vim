set timeoutlen=500

" Map Leader and LocalLeader keys {{{1
" -------------------------------
let mapleader = '<Space>'
let maplocalleader = ','

" Define WhichKey maps {{{1
" --------------------
let g:which_key_leader_map = { 'name': 'global' }
let g:which_key_localleader_map = { 'name': 'local' }

" Leader keybinds {{{1
" ---------------
let g:which_key_leader_map['b'] = {
\ 'name': '+buffer',
\ 'd':    ['bd', 'delete-buffer'],
\ 'f':    ['bfirst', 'first-buffer'],
\ 'h':    ['Startify', 'home-buffer'],
\ 'l':    ['blast', 'last-buffer'],
\ 'n':    ['bnext', 'next-buffer'],
\ 'p':    ['bprevious', 'previous-buffer'],
\ '?':    ['Buffers', 'fzf-buffer'],
\ }

let g:which_key_leader_map['t'] = {
\ 'name': '+tab',
\ 'q':    ['tabclose',    'close-tab'],
\ 'f':    ['tabfirst',    'first-tab'],
\ 'l':    ['tablast',     'last-tab'],
\ 'n':    ['tabnext',     'next-tab'],
\ 'p':    ['tabprevious', 'previous-tab'],
\ 'o':    ['tabonly',     'maximize-tab'],
\ }

" Legacy keybinds {{{2
" {"keys":["?"],          "action":"FindHelp",              "name":"help" },
" {"keys":[" "],          "action":"FindFiles",             "name":"find" },
" {"keys":[":"],          "action":"FindCommand",           "name":"search-vim-commands" },
" {"keys":["r"],          "action":"TagbarToggle",          "name":"symbols" },
"
" {"keys":["T"],          "action":"",                      "name":"+terminal" },
" {"keys":["T","t"],      "action":"tabnew",                "name":"new-term-tab" },
" {"keys":["T","v"],      "action":"vsplit",                "name":"new-term-vsplit" },
" {"keys":["T","s"],      "action":"split",                 "name":"new-term-split" },
"
" {"keys":["g"],          "action":"",                      "name":"+git" },
" {"keys":["g","c"],      "action":"Gina changes",          "name":"changes" },
" {"keys":["g","C"],      "action":"Gina commit",           "name":"commit" },
" {"keys":["g","p"],      "action":"Gina! pull",            "name":"pull" },
" {"keys":["g","s"],      "action":"Gina status",           "name":"status" },
" {"keys":["g","t"],      "action":"Gina tag",              "name":"tag" },
" {"keys":["g","b"],      "action":"Gina branch",           "name":"branch" },
" {"keys":["g","u"],      "action":"Gina! push",            "name":"push" },
"
" {"keys":["o"],          "action":"",                      "name":"+open" },
" {"keys":["o","M"],      "action":"messages",              "name":"messages" },
" {"keys":["o","l"],      "action":"lopen",                 "name":"loc-list" },
" {"keys":["o","f"],      "action":"copen",                 "name":"qf-list" },
"
" {"keys":["x"],          "action":"",                      "name":"+toggle" },
" {"keys":["x", "ig"],    "action":"IndentGuidesToggle",    "name":"indent-guides" },
" {"keys":["x", "w"],     "action":"setl wrap!",            "name":"text-wrap" },
" {"keys":["x", "s"],     "action":"setl spell!",           "name":"spellcheck" },
" {"keys":["x", "ln"],    "action":"setl number!",          "name":"line-num" },
" {"keys":["x", "lr"],    "action":"setl relativenumber!",  "name":"relative-line-num" },
"
" {"keys":["j"],          "action":"",                      "name":"+jobs" },
" {"keys":["j","s"],      "action":"NeomakeStatus",         "name":"current-status" },
" {"keys":["j","l"],      "action":"NeomakeListJobs",       "name":"list-jobs" },
" {"keys":["j","i"],      "action":"NeomakeInfo",           "name":"neomake-info" },
" {"keys":["j","Q"],      "action":"NeomakeCancelJobs",     "name":"terminate-all" },
" {"keys":["j","x"],      "action":"",                      "name":"+toggle-neomake" },
" {"keys":["j","x","x"],  "action":"NeomakeToggle",         "name":"global" },
" {"keys":["j","x","b"],  "action":"NeomakeToggleBuffer",   "name":"current buffer" },
" {"keys":["j","x","t"],  "action":"NeomakeToggleTab",      "name":"current tab" },
" {"keys":["b"],          "action":"",                      "name":"+buffer" },
" {"keys":["b","N"],      "action":"enew",                  "name":"create" },
" {"keys":["b","h"],      "action":"split",                 "name":"hsplit" },
" {"keys":["b","v"],      "action":"vsplit",                "name":"vsplit" },
" {"keys":["b","l"],      "action":"FindBuffer",            "name":"list" },
" {"keys":["b","n"],      "action":"bnext",                 "name":"next" },
" {"keys":["b","p"],      "action":"bprevious",             "name":"prev" },
" {"keys":["b","w"],      "action":"bwipeout",              "name":"wipeout" },
" {"keys":["b","x"],      "action":"bdelete",               "name":"delete" },
"
" {"keys":["f"],           "name":"+file",                    "action":"" },
" {"keys":["f","t"],       "name":"set-filetype",            "action":"Denite filetype" },
"
" {"keys":["F"],           "name":"+fnctl",                   "action":"" },
" {"keys":["F","r"],       "name":"repl",                     "action":"tabnew | exe \"te fnctl repl\" | insert" },
" {"keys":["F","R"],       "name":"rebuild",                  "action":"tabnew | exe \"te fnctl rebuild\" | insert" },
" {"keys":["F","T"],       "name":"rebuild-test",             "action":"tabnew | exe \"te fnctl rebuild-test\" | insert" },
" {"keys":["F","P"],       "name":"prune",                    "action":"tabnew | exe \"te fnctl prune\" | insert" },
" {"keys":["F","s"],       "name":"nix path",                "action":"" },
" {"keys":["F","s","c"],   "name":"nixos-config",          "action":"SearchNixOSConfig" },
" {"keys":["F","s","o"],   "name":"nixos",                 "action":"SearchNixOS" },
" {"keys":["F","s","p"],   "name":"nixpkgs",               "action":"SearchNixPkgs" },
" {"keys":["F","s","f"],   "name":"fnctl",                 "action":"SearchFnCtl" },
" {"keys":["F","s","P"],   "name":"nixpkgs-fnctl",         "action":"SearchFnCtlPkgs" },
"
" {"keys":["v"],           "name":"+view",                    "action":"" },
" {"keys":["v","g"],       "name":"global-vars",             "action":"execute \"Redir PP g:\" | setfiletype vim" },
" {"keys":["v","b"],       "name":"buffer-vars",             "action":"execute \"Redir PP b:\" | setfiletype vim" },
" {"keys":["v","v"],       "name":"vim-vars",                "action":"execute \"Redir PP v:\" | setfiletype vim" },
" {"keys":["v","w"],       "name":"window-vars",             "action":"execute \"Redir PP w:\" | setfiletype vim" },
" {"keys":["v","r"],       "name":"registers",               "action":"Redir registers" },
" {"keys":["v","R"],       "name":"reload-mappings ",        "action":"call leaderGuide#parse_mappings()" },
"
" {"keys":["p"],           "name":"+snippets",                "action":"" },
" {"keys":["p","e"],       "name":"snippets",                 "action":"UltiSnipsEdit" },
"
" {"keys":["e"],           "name":"+edit",                    "action":"" },
" {"keys":["e","w"],       "name":"trim-whitespace",          "action":"call fnctl#textutils#trim_whitespace()" },
"
" {"keys":["w"],           "name":"+window",                  "action":"" },
" {"keys":["w","j"],       "name":"next-window",              "action":"wNext" },
" {"keys":["w","k"],       "name":"prev-winndow",             "action":"wprevious" },
"
" {"keys":["n"],           "name":"+notes",                   "action":"" },
" {"keys":["n","n"],       "name":"open-journal",             "action":"VimwikiDiaryIndex" },
" {"keys":["n","+"],       "name":"add-note",                 "action":"VimwikiTabMakeDiaryNote" },
" {"keys":["n","i"],       "name":"open-notes",               "action":"VimwikiTabIndex" }


" Default LocalLeader Mappings {{{1
" -----------------------------
let g:which_key_localleader_map.b = {
      \ 'name': '+build',
      \ 'b':    ['echo "Not Implemented!"', 'default-build'],
      \ }

" Register Maps to WhichKey {{{1
" -------------------------
call which_key#register(',', "g:which_key_localleader_map")
call which_key#register('SPC', "g:which_key_leader_map")

" Automatically Hide Statusbar in WhichKey {{{1
" ----------------------------------------
autocmd! FileType which_key
autocmd  FileType which_key
      \ set laststatus=0 noshowmode noruler
      \  |  autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Manually update the maps {{{1
call which_key#parse_mappings()

" Bind WhichKey to VIM mappings {{{1
" -----------------------------
nnoremap <leader>       :WhichKey 'SPC'<CR>
vnoremap <leader>       :<C-u>WhichKeyVisual 'SPC'<CR>
nnoremap <localleader>  :WhichKey ','<CR>
vnoremap <localleader>  :<C-u>WhichKeyVisual ','<CR>

" vim: fdm=marker
