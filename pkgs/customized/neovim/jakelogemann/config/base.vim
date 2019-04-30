" Section: Dotfiles Global Config {{{1
" If the dotfiles variable doesn't exist, ensure it does.
if !exists('g:dotfiles') | let g:dotfiles = {'dirs': {}} | endif

" Section: Runtime / Execution / Cache Paths {{{2
" This is where all of the paths are resolved for the local system. It tries to
" be as intelligent as possible about how it defines values.

" Paths: Global Directory Constants {{{3
" This section has to be first, its values are used in the next sections
unlockvar g:dotfiles.dirs

" Ensure that wherever this directory is, that its added to the runtime path.
let g:dotfiles.dirs.vim_dir        = fnamemodify(expand('<sfile>'), ':h')
execute printf("set runtimepath^=%s", g:dotfiles.dirs.vim_dir)

" These directories should be relatively constant on most *NIX-based systems.
let g:dotfiles.dirs.config     = expand('~/.config/'. (has('nvim')?'nvim':'vim'))
let g:dotfiles.dirs.cache      = expand('~/.cache/'.  (has('nvim')?'nvim':'vim'))
let g:dotfiles.dirs.plugins    = g:dotfiles.dirs.vim_dir . '/vendor'

" Paths: Cache Directories {{{3
let g:dotfiles.dirs.backup_files   = g:dotfiles.dirs.cache . '/backup_files'
let g:dotfiles.dirs.swap_files     = g:dotfiles.dirs.cache . '/swap_files'
let g:dotfiles.dirs.undo_files     = g:dotfiles.dirs.cache . '/undo_files'
let g:dotfiles.dirs.sessions       = g:dotfiles.dirs.cache . '/sessions'
let g:dotfiles.dirs.views          = g:dotfiles.dirs.cache . '/views'

" Paths: Config Directories {{{3
let g:dotfiles.dirs.data           = g:dotfiles.dirs.config . '/data'
let g:dotfiles.dirs.snippets       = g:dotfiles.dirs.config . '/snips'
let g:dotfiles.dirs.templates      = g:dotfiles.dirs.config . '/templates'
let g:dotfiles.dirs.spell_dir      = g:dotfiles.dirs.config . '/spell'

" Paths: Other miscellaneous directories {{{3
let g:dotfiles.dirs.wiki           = $HOME . '/Notes'

" Paths: Important Files {{{3
let g:dotfiles.configs = {}
let g:dotfiles.configs.vimrc_global = expand('~/.vimrc')
let g:dotfiles.configs.vimrc_local  = g:dotfiles.configs.vimrc_global . '.local'

" Lock these core variables to prevent accidental fuckery.
lockvar g:dotfiles.dirs

" Paths: Ensure all directories listed exist. {{{3
for d in values(g:dotfiles.dirs)
  silent! call mkdir(d, 'p', 0700)
endfor

" Paths: Set backups, viminfo, undodirs, etc. {{{3
if exists('$HOME') && !exists('$VIM_NOSWAP')
  execute printf('set backupdir=%s//', g:dotfiles.dirs.backup_files)
  execute printf('set directory=%s//', g:dotfiles.dirs.swap_files)
  execute printf('set undodir=%s//', g:dotfiles.dirs.undo_files)
  execute printf('set viewdir=%s//', g:dotfiles.dirs.views)
  execute printf('set viminfo+=n%s/viminfo', g:dotfiles.dirs.cache)
  set undofile

  silent! helptags ALL
else
  set nobackup    backupdir=  nowritebackup
  set noswapfile  directory=
  set noundofile  undodir=
  set viewdir=
  set viminfo=
endif

set clipboard=unnamedplus

" Tabs vs. Spaces!
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set viewoptions-=options

filetype plugin on                               "Enable plugins in files.
syntax on                                        "Enable syntax highlighting.
set nowrap nolist
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color' | set t_ut= | endif

" If the terminal has more than 16 colors, Assume there's 256 color support.
if !has('gui_running') && &t_Co > 16 | set t_Co=256 | endif

" General VIM Options
set autowrite                                    "Automatically write all buffers on :make or similar.
set autoread                                     "Automatically read a buffer when its file changes.
set background=dark                              "Use dark colorscheme.
set hidden                                       "Allows hiding buffers w/out saving first.
set laststatus=2                                 "always show status line
set lazyredraw                                   "toggle updating screen during macro playback
set splitbelow nosplitright                      "Adjust where pane splits are created.
set nonumber relativenumber                      "Show line numbers.
set path+=**                                     "Automatically search subdirectories for things like <esc>gf
set ttimeout ttimeoutlen=10                      "Delay in mappings (should be very small).
set timeout  timeoutlen=1000                     "Delay after mapping.

set updatecount=80                               "update swapfiles every 80 typed chars
set updatetime=1000                              "CursorHold interval

set whichwrap=b,h,l,s,<,>,[,],~                  "allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                              "substitute for 'wildchar' (<Tab>) in macros

" Searching for Text {{{
set incsearch nohlsearch                         "Immediately start highlighting search matches.
set ignorecase smartcase                         "Use Smartcase for searching.
set wrapscan                                     "Continue searching at end of file.
" }}}

if has('wildignore') " {{{
  set wildignore+=*.o,*.rej           " patterns to ignore during file-navigation
endif " }}}

if has('wildmenu') " {{{
  set wildmenu                        " show options as list when switching buffers etc
  set wildmode=longest:full,full                   "shell-like autocomplete to unambiguous portion
endif " }}}

if has('mksession') " {{{
  set viewoptions-=options
endif " }}}

if has('virtualedit') " {{{
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
  " set virtualedit=all       " Can extend cursor past end of line.
endif " }}}

if has('highlight') " {{{  Highlighting Options.
  set highlight+=@:ColorColumn                     "~/@ at end of window, 'showbreak'
  set highlight+=N:DiffText                        "make current line number stand out a little
  set highlight+=c:LineNr                          "blend vertical separators with line numbers
endif " }}}

if has('syntax') " {{{
  set spellcapcheck=                  " don't check for capital letters at start of sentence
endif " }}}

" Toggle cursor line intelligently.
autocmd InsertLeave,WinEnter * setl cursorline
autocmd InsertEnter,WinLeave * setl nocursorline

" Automatically start the cursor in the same position it left off.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$")
      \ |  execute "normal! g`\""
      \ | endif

" Dont lose selection on indent/deindent.
" xnoremap <  <gv
" xnoremap >  >gv

set omnifunc=syntaxcomplete#Complete

if has('mouse') " {{{ Mouse Configuration
  set mouse=a
  set mousehide  " Turn off mouse when typing.
endif " }}}

" Enable Unicode Support
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Disable syntax highlighting after 200 columns to preserve speed.
set synmaxcol=200

if has('nvim') && executable('nvr')
  let $VISUAL = 'nvr -cc split --remote-wait'
  let $EDITOR = 'nvr -cc split --remote-wait'

  command! DisconnectNeoVimClients
      \  if exists('b:nvr')
      \|   for client in b:nvr
      \|     silent! call rpcnotify(client, 'Exit', 1)
      \|   endfor
      \| endif
endif

" Preferences: User Information {{{2
if !exists('g:dotfiles.user')
  let g:dotfiles.user = {}
  let g:dotfiles.user.first_name = 'Jake'
  let g:dotfiles.user.last_name = 'Logemann'
  let g:dotfiles.user.email = '@jlogemann.io'
  let g:dotfiles.user.username = 'JakeLogemann'
endif

" Highlight the region persistently.
let g:highlightedyank_highlight_duration = 2

" Thanks, but if theres no python, we're already aware from other plugins...
let g:UltiSnipsNoPythonWarning = 1

if !exists('##TextYankPost') || (v:version < 800 && !has('nvim'))
  map y <Plug>(highlightedyank)
  hi! link HighlightedyankRegion vimFold
endif

if has('nvim')
  silent! UpdateRemotePlugins
endif

set background=dark
colorscheme gruvbox
