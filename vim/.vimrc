" GENERAL ----------------------------------------

syntax enable
set number
set cursorline
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
set hlsearch 

" Color Scheme
colorscheme carbo
"colorscheme dracula_perso

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'      "  Vim Package manager
Plugin 'airblade/vim-gitgutter'    "  Git plugin - display + - ~ in vim gutter
Plugin 'scrooloose/nerdcommenter'  "  Comment plugin - Toggle comments
Plugin 'Yggdroot/indentLine'       "  Indent plugin - display indent lines in code
Plugin 'scrooloose/nerdtree'       "  Tree plugin - display file tree
Plugin 'godlygeek/tabular'         "  Align plugin - align code according to symbol
Plugin 'sheerun/vim-polyglot'      "  Syntax plugin - syntax highlighting according to language
"Plugin 'Valloric/YouCompleteMe'    "  Complete plugin - auto complete
"Plugin 'rdnetto/YCM-Generator'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mboughaba/i3config.vim'
Plugin 'junegunn/fzf.vim'

call vundle#end()
set runtimepath^=~/.vim/plugin

" add fzf program for fzf.vim
set rtp+=~/dotfiles/fzf/fzf

" create location to store swap (.swp) files
set directory^=$HOME/.vim/tmp//

filetype indent plugin on

" PLUGIN OPTION ----------------------------------
" Disable specific syntax highlighting (Plugin 'sheerun/vim-polyglot')
let g:polyglot_disabled = ['markdown']

" Marker style (Plugin 'Yggdroot/indentLine')
let g:indentLine_char = '|'

" Enable doxygen for C, C++
let g:load_doxygen_syntax=1

" Get functions for fzf.vim plugin + devicons
so $HOME/.vim/plugin/fzf_devicon.vim

" STATUS BAR -------------------------------------

" Status bar style
set statusline=
set statusline +=%7*%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline +=%8*%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline +=%8*%{(mode()=='R')?'\ \ REPLAC\ ':''}
set statusline +=%6*%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline +=%1*\ %n\ %*        "  buffer number
set statusline +=%3*%{&ff}%*        "  file format
set statusline +=%5*\ %y%*          "  file type
set statusline +=%4*\ %<%F%*        "  full path
set statusline +=%2*%m%*            "  modified flag
set statusline +=%1*%=%5l%*         "  current line
set statusline +=%2*/%L%*           "  total lines
set statusline +=%1*%4v\ %*         "  virtual column number
set statusline +=%2*0x%04B\ %*      "  character under cursor
set statusline +=%3*%{winwidth(0)}  "  window width

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

" ESC key to jk or kj or jj
inoremap kj <Esc>
inoremap jk <Esc>
inoremap jj <Esc>

" No highlight search
nnoremap :/<CR> :nohlsearch<CR>

" Automaticaly close brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Switch windows with Alt + Arrows
nmap <silent> <A-Left> <C-W>h
nmap <silent> <A-Right> <C-W>l
nmap <silent> <A-Up> <C-W>k
nmap <silent> <A-Down> <C-W>j

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
nmap :ga <Plug>GitGutterStageHunk
nmap :gn <Plug>GitGutterNextHunk

" FZF Plugin -------------------------------------------------------------------
" Files (':Files' with devicons)
nmap <C-p> :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND)<CR>
" Git tracked files (ignore submodules + .gitignore files)
nmap <C-g> :call Fzf_files_with_dev_icons("git ls-files \| uniq")<CR>
" Lines
nmap <C-l> :Lines<CR>
" Rg
nmap <C-f> :Rg<CR>
" Tags
nmap <C-t> :Tags<CR>
" Git diff
nmap <C-d> :call Fzf_git_diff_files_with_dev_icons()<CR> 

" Paste multiple in visual mode
xnoremap p pgvy

" Tabularize Plugin to align according to a symbol
ca Tab Tabularize
nmap :t= :Tab /^[^=]*\zs=/l1c1<CR>
vmap :t= :Tab /^[^=]*\zs=/l1c1<CR>
" Tab only the first space
nmap :t<Space> :Tab /^[ ]*\zs[^ ]*\zs /l0c0<CR>
vmap :t<Space> :Tab /^[ ]*\zs[^ ]*\zs /l0c0<CR>

" Correct indentation JSON files
nmap :json<CR> :%!python -m json.tool<CR>

nmap <C-_> :set hlsearch!<CR>

" Abbreviations ----------------------------------

" Abbreviation for ack tool
ca Ack Ack!
nnoremap <C-a> :Ack!<Space>

" Vertical resize abbreviation
ca vr vertical resize

