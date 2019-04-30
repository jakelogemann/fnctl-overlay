setlocal foldlevel=1 foldenable
autocmd BufWritePre <buffer> call fnctl#textutils#trim_whitespace()

let b:my_localleader_guide = { 
      \   'visual': {
      \     '=': ['Tabularize assignment<cr>', 'Align lines by =']
      \   },
      \   'normal': {
      \     's': {
      \       'name': 'Source ...',
      \       's': ['execute printf("source %s", expand("%"))', 'Source Buffer'],
      \     },
      \   }
      \ }

