" Vimwiki
let g:vimwiki_hl_headers = 1      "Highlights headers as red/green/blue.
let g:vimwiki_hl_cb_checked = 2   "Highlight checked boxes/children as a Comment.
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_use_mouse = 1
let g:vimwiki_folding = 'expr'
let g:vimwiki_dir_link = 'index'  "Crerate index.wiki if no file is given.
let g:vimwiki_html_header_numbering = 2  "Number headers, starting at h2.
let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_conceallevel = 0

let g:vimwiki_auto_chdir = 1  "Automatically change directory to vimwiki page.

let g:vimwiki_ext2syntax = {
      \'.md': 'markdown',
      \ '.mkd': 'markdown',
      \ '.wiki': 'media'}

let s:wiki_default = {}
let s:wiki_default.auto_tags = 1
let s:wiki_default.diary_index = 'index'
let s:wiki_default.diary_rel_path = 'daily/'
let s:wiki_default.ext = '.md'
let s:wiki_default.html_template = get(s:wiki_default, 'path') . 'template.tpl'
let s:wiki_default.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let s:wiki_default.path = expand('~/Notes/')
let s:wiki_default.syntax = 'markdown'

let g:vimwiki_list = [s:wiki_default]

