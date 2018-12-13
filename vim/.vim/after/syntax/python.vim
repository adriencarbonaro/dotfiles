" vim-polyglot tend to stop 'print' highlighting. This is a fix
syn keyword Function print

syn match   pythonCustomFunc  "\w\+\s*(\@="
hi def link pythonCustomFunc  Function
