call denite#custom#map('insert', '<C-b>', '<Left>')
call denite#custom#map('insert', '<C-f>', '<Right>')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-h>', '<denite:move_caret_to_one_word_left>', 'noremap')
call denite#custom#map('insert', '<C-l>', '<denite:move_caret_to_one_word_right>', 'noremap')
call denite#custom#map('insert', '<C-a>', '<denite:move_caret_to_head>', 'noremap')
call denite#custom#map('insert', '<C-e>', '<denite:move_caret_to_tail>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:paste_from_default_register>', 'noremap')
call denite#custom#map('insert', '<C-r>', '<denite:restart>', 'noremap')
call denite#custom#map('insert', '<C-d>', '<denite:scroll_page_forwards>', 'noremap')
call denite#custom#map('insert', '<C-u>', '<denite:scroll_page_backwards>', 'noremap')
call denite#custom#map('insert', '<C-Space>', '<denite:toggle_select>', 'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:toggle_select>', 'noremap')
call denite#custom#map('insert', '<C-y>', '<denite:yank_to_default_register>', 'noremap')
call denite#custom#map('insert', '<C-i>', '<denite:toggle_insert_mode>', 'noremap')
call denite#custom#map('insert', '<Up>',  '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<Down>','<denite:move_to_next_line>', 'noremap')


call denite#custom#option('_', {
\ 'auto_resize':              v:false,
\ 'auto_resume':              v:true,
\ 'cursor_wrap':              v:true,
\ 'empty':                    v:false,
\ 'highlight_matched_char':   'Conceal',
\ 'highlight_matched_range':  'LineNr',
\ 'immediately_1':            v:true,
\ 'matchers':                 'matcher/fuzzy',
\ 'post_action':              'quit',
\ 'prompt':                   '»',
\ 'resume':                   v:true,
\ 'ignorecase':               v:false,
\ 'smartcase':                v:true,
\ 'sorters':                  'sorter/sublime',
\ 'source_names':             'short',
\ 'unique':                   v:true,
\ 'updatetime':               50,
\ })

command! FindBuffer   Denite -buffer-name=FindBuffer  buffer
command! FindVimHelp  Denite -buffer-name=FindVimHelp help
command! FindCommand  Denite -buffer-name=FindCommand command
command! FindFiles    Denite -buffer-name=FindFiles   buffer directory_rec file_rec
