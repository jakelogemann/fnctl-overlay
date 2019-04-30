command! -nargs=1 -complete=help Thelp tab help <f-args>
command! -nargs=1 -complete=help Vhelp vertical help <f-args>
call fnctl#nix#inject()
cabbrev thelp Thelp
cabbrev THelp Thelp
cabbrev vhelp Vhelp
cabbrev VHelp Vhelp

cabbrev Git     Gina
cabbrev Gstatus Gina status
cabbrev Gcommit Gina commit
