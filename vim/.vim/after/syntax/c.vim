syn match Pluses "[\+\-\*\=\<\>]"
syn match Parentheses "[\{\}\[\]\(\)]"

hi Pluses      ctermfg=229
hi Parentheses ctermfg=229

hi cType       ctermfg=14

syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
hi def link cCustomFunc  Function
