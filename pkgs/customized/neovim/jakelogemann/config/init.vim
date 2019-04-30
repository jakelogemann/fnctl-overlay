let g:fnctl_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

set rtp+=g:fnctl_dir
execute printf("source %s/base.vim", g:fnctl_dir)
