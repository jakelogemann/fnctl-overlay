function! MyStatusLineLeaderGuide(...)
  if &filetype == 'leaderGuide'
    let w:airline_section_a       = 'leaderGuide'
    let w:airline_section_b       = ""
    let w:airline_section_c       = ""
    let w:airline_section_gutter  = ""
    let w:airline_section_warning = ""
    let w:airline_section_error   = ""
    let w:airline_section_x       = ""
    let w:airline_section_y       = ""
    let w:airline_section_z       = ""
    setlocal statusline=%!airline#statusline(1)
  endif
endfunction

function! AirlineInit()
  call airline#parts#define_condition('isNixOS', 'getcwd() =~ "/etc/nixos"')
  call airline#parts#define_accent('error', 'red')
  call airline#parts#define_accent('ok', 'green')
  call airline#add_statusline_func('MyStatusLineLeaderGuide')
  call airline#parts#define_minwidth('ffenc', 10000)

endfunction

function! MyStatusLineInit()
  " Extensions
  " ----------
  " Disable automatic loading of extensions, instead load only the parts we
  " need. This is because there is a large number of plugins and traversing them
  " all seems needless...
  " let g:airline#extensions#disable_rtp_load = 0
  " let g:airline_extensions = [
  "       \ 'branch',
  "       \ 'tabline',
  "       \ 'ale',
  "       \ 'whitespace',
  "       \ ]

  " Feature Flags
  " -------------
  let g:airline_powerline_fonts               = 1
  let g:airline#extensions#ale#enabled        = 1
  let g:airline#extensions#nrrwrgn#enabled    = 1
  let g:airline#extensions#tabline#enabled    = 1
  let g:airline#extensions#whitespace#enabled = 1

  " Try setting this to zero, if you notice bleeding color artifacts.
  let airline#extensions#default#section_use_groupitems = 1

  " Section Definitions
  " -------------------
  " In order of display, right to left:
  " let g:airline_section_a       = airline#section#create_left(['mode'])
  " let g:airline_section_b       = airline#section#create_left(['%t'])
  " let g:airline_section_c       = airline#section#create_left([])
  " let g:airline_section_gutter  = airline#section#create([])
  " let g:airline_section_x       = airline#section#create_right([])
  " let g:airline_section_y       = airline#section#create_right([])
  " let g:airline_section_z       = airline#section#create_right(['ffenc', 'crypt'])
  " let g:airline_section_warning = airline#section#create([])
  " let g:airline_section_error   = airline#section#create([])

  " let l:section_truncate_width = {}
  " let l:section_truncate_width['b'] = 79
  " let l:section_truncate_width['x'] = 60
  " let l:section_truncate_width['y'] = 88
  " let l:section_truncate_width['z'] = 45
  " let l:section_truncate_width['warning'] = 80
  " let l:section_truncate_width['error'] = 80
  "
  " let g:airline#extensions#default#section_truncate_width = l:section_truncate_width

  let g:airline#extensions#default#layout = [
        \ [ 'a', 'b', 'c' ],
        \ [ 'x', 'y', 'z', 'error', 'warning' ]
        \ ]



  let g:airline#extensions#ale#close_lnum_symbol = ')'
  let g:airline#extensions#ale#error_symbol      = 'E:'
  let g:airline#extensions#ale#open_lnum_symbol  = '(L'
  let g:airline#extensions#ale#show_line_numbers = 1
  let g:airline#extensions#ale#warning_symbol    = 'W:'

  let g:airline#extensions#branch#format = 1  " Strip all but tail of branch in statusline.

  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'v',
      \ 'V'  : 'V',
      \ '' : '^V',
      \ 's'  : 's',
      \ 'S'  : 'S',
      \ '' : '^S',
      \ 't'  : 'T',
      \ }

  let g:airline#extensions#tabline#buf_label_first          = 1
  let g:airline#extensions#tabline#buffer_idx_mode          = 1
  let g:airline#extensions#tabline#buffers_label            = 'Buf'
  let g:airline#extensions#tabline#current_first            = 0
  let g:airline#extensions#tabline#exclude_preview          = 1
  let g:airline#extensions#tabline#excludes                 = []
  let g:airline#extensions#tabline#fnamemod                 = ':t:r'
  let g:airline#extensions#tabline#fnametruncate            = 20
  let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
  let g:airline#extensions#tabline#overflow_marker          = '…'
  let g:airline#extensions#tabline#show_close_button        = 0
  let g:airline#extensions#tabline#middle_click_preserves_windows = 1
  let g:airline#extensions#tabline#show_buffers             = 0
  let g:airline#extensions#tabline#show_splits              = 0
  let g:airline#extensions#tabline#show_tabs                = 1
  let g:airline#extensions#tabline#tab_nr_type              = 1   " tab ID number
  let g:airline#extensions#tabline#tabs_label               = '裡' " NerdFont f9e8 (tab)
  let g:airline#extensions#tabline#buffer_idx_format        = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
        \ }

  let g:airline#extensions#wordcount#formatter#default#fmt  = '%swords'
  let g:airline#extensions#wordcount#formatter#default#fmt_short = '%sW'

  let g:airline#extensions#whitespace#mixed_indent_algo     = 2
  let g:airline#extensions#whitespace#symbol                = '!'
  let g:airline#extensions#whitespace#max_lines             = '50000'
  let g:airline#extensions#whitespace#show_message          = 1
  let g:airline#extensions#whitespace#trailing_format       = 'trailing[%s]'
  let g:airline#extensions#whitespace#mixed_indent_format   = 'mixed-indent[%s]'
  let g:airline#extensions#whitespace#long_format           = 'long[%s]'
  let g:airline#extensions#whitespace#mixed_indent_file_format = 'mix-indent-file[%s]'
  let g:airline#extensions#whitespace#show_message = 1

  let g:airline#extensions#c_like_langs = [
  \ 'c',
  \ 'cpp',
  \ 'cuda',
  \ 'go',
  \ 'javascript',
  \ 'ld',
  \ 'php'
  \ ]

  let g:airline#extensions#ctrlp#show_adjacent_modes = 0

  let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
  let g:airline#extensions#quickfix#location_text = 'Location'

  autocmd User AirlineAfterInit call AirlineInit()
endfunction

call MyStatusLineInit()
