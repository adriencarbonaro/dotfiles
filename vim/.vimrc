" GENERAL ----------------------------------------

syntax enable
set number
set ruler
set encoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set showcmd
set t_Co=256
set mouse=a
set noshowmode
set tabstop=4
set shiftwidth=4
set expandtab


" Color Scheme
colorscheme carbo
"colorscheme dracula_perso

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
call vundle#end()
set runtimepath^=~/.vim/bundle/ctrlp.vim
filetype indent plugin on

" PLUGIN OPTION ----------------------------------

" Marker style (Plugin 'Yggdroot/indentLine')
let g:indentLine_char = '|'

" CtrlP Plugin variables
let g:ctrlp_regexp = 1
let g:ctrlp_show_hidden = 1

" STATUS BAR -------------------------------------

" Status bar style
set statusline=
set statusline +=%7*%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline +=%8*%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline +=%8*%{(mode()=='R')?'\ \ REPLAC\ ':''}
set statusline +=%6*%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline +=%1*\ %n\ %*         "buffer number
set statusline +=%3*%{&ff}%*         "file format
set statusline +=%5*\ %y%*     	     "file type
set statusline +=%4*\ %<%F%*   	     "full path
set statusline +=%2*%m%*             "modified flag
set statusline +=%1*%=%5l%*            "current line
set statusline +=%2*/%L%*            "total lines
set statusline +=%1*%4v\ %*          "virtual column number
set statusline +=%2*0x%04B\ %*       "character under cursor
set statusline +=%3*%{winwidth(0)} "window width

" Colors for status bar
hi User1 ctermfg=166 ctermbg=236
hi User2 ctermfg=9   ctermbg=236
hi User3 ctermfg=13  ctermbg=236
hi User4 ctermfg=12  ctermbg=236
hi User5 ctermfg=11  ctermbg=236

hi User6 ctermfg=255 ctermbg=60
hi User7 ctermfg=255 ctermbg=28
hi User8 ctermfg=255 ctermbg=94

" BINDINGS ---------------------------------------

" Switch windows with Alt + Arrows
nmap <silent> <C-Left> <C-W>h
nmap <silent> <C-Right> <C-W>l
nmap <silent> <C-Up> <C-W>k
nmap <silent> <C-Down> <C-W>j

" Vertical/Horizontal split window
nmap <C-S-h> :sp<CR>
nmap <C-S-v> :vsp<CR>

" Previous/Next/Toggle switching buffers
"nmap <C-P> :bprev<CR>
"nmap <C-N> :bnext<CR>
nmap <C-B> <C-^>
nmap :bt<CR> <C-^>

" Toggle comments
map <C-@> <Plug>NERDCommenterToggle

" GitGutter Plugin
nmap :gd <Plug>GitGutterPreviewHunk

" CtrlP Plugin invoking to add path
nmap :cp<CR> :CtrlP

" Abbreviations ----------------------------------

" Abbreviation for ack tool
ca ack Ack!

" Vertical resize abbreviation
ca vr vertical resize
