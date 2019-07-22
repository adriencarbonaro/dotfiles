" Vim color file
" Original Maintainer: Lars H. Nielsen (dengmao@gmail.com)
" Last Change: 2014-07-05
"
" Modified version by
"  Adam Stankiewicz (sheerun@sher.pl)
" Modified version of wombat for 256-color terminals by
"  David Liang (bmdavll@gmail.com)
" based on version by
"  Danila Bespalov (danila.bespalov@gmail.com)

set background=dark

if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif

let colors_name = "carbo"

" General colors
hi Normal ctermfg=250
hi Cursor ctermfg=234 ctermbg=13 
hi Visual ctermfg=251 ctermbg=239
hi VisualNOS ctermfg=251 ctermbg=236
hi Search ctermfg=177 ctermbg=241
hi Folded ctermfg=103 ctermbg=237
hi Title ctermfg=230 cterm=bold
hi VertSplit ctermfg=236 ctermbg=66 
hi LineNr ctermfg=241
hi SpecialKey ctermfg=241 ctermbg=235 cterm=none
hi WarningMsg ctermfg=203
hi Directory ctermfg=75 cterm=bold
"hi ErrorMsg ctermfg=196 ctermbg=234 cterm=bold guifg=#e3e0d7 guibg=#3a3a3a gui=bold
"hi SpellBad ctermfg=196 ctermbg=234 cterm=bold guifg=#e3e0d7 guibg=#3a3a3a gui=bold
"hi SpellCap ctermfg=196 ctermbg=234 cterm=bold guifg=#e3e0d7 guibg=#3a3a3a gui=bold

" Vim >= 7.0 specific colors
if version >= 700
" Highlight current line
hi CursorLine cterm=none
" Highlight current line number
hi CursorLineNr ctermfg=183
hi MatchParen ctermfg=228 ctermbg=101 cterm=bold
hi Pmenu ctermfg=230 ctermbg=238
hi PmenuSel ctermfg=232 ctermbg=192
endif

" Diff highlighting
hi DiffAdd ctermbg=17
hi DiffDelete ctermfg=234 ctermbg=60
hi DiffText ctermbg=53
hi DiffChange ctermbg=237

" Syntax highlighting
hi Keyword ctermfg=75
hi Statement ctermfg=75
hi Constant ctermfg=173
hi Number ctermfg=167
hi PreProc ctermfg=147
hi Function ctermfg=183
hi Identifier ctermfg=81
hi Type ctermfg=85
hi Special ctermfg=229
hi String ctermfg=113
hi Comment ctermfg=66
hi Todo ctermfg=101

" Git
hi diffAdded ctermfg=2
hi diffRemoved ctermfg=167


" Links
hi! link FoldColumn Folded
hi! link CursorColumn CursorLine
hi! link NonText LineNr
