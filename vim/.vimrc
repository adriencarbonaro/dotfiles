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
colorscheme onedark

" PLUGIN OPTION ----------------------------------
" Disable specific syntax highlighting (Plugin 'sheerun/vim-polyglot')
let g:polyglot_disabled = ['markdown']

" Marker style (Plugin 'Yggdroot/indentLine')
let g:indentLine_char = '|'

" Enable doxygen for C, C++
let g:load_doxygen_syntax=1

" Get functions for fzf.vim plugin + devicons
so $HOME/.config/vim/plugin/fzf_devicon.vim

set runtimepath^=~/config/vim/plugin

" add fzf program for fzf.vim
set rtp+=~/dotfiles/fzf/fzf

" create location to store swap (.swp) files
set directory^=$HOME/.config/vim/tmp//

filetype indent plugin on

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
hi User1 ctermfg=166
hi User2 ctermfg=9
hi User3 ctermfg=13
hi User4 ctermfg=12
hi User5 ctermfg=11

hi User6 ctermfg=255 ctermbg=60
hi User7 ctermfg=255 ctermbg=28
hi User8 ctermfg=255 ctermbg=27

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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:lightline = { 'colorscheme': 'onedark' }

" vim -b : edit binary using xxd-format!
augroup Binary
  autocmd!
  autocmd BufReadPre  *.bin set binary
  autocmd BufReadPost *.bin
    \ if &binary
    \ |   execute "silent %!xxd -c 32"
    \ |   set filetype=xxd
    \ |   redraw
    \ | endif
  autocmd BufWritePre *.bin
    \ if &binary
    \ |   let s:view = winsaveview()
    \ |   execute "silent %!xxd -r -c 32"
    \ | endif
  autocmd BufWritePost *.bin
    \ if &binary
    \ |   execute "silent %!xxd -c 32"
    \ |   set nomodified
    \ |   call winrestview(s:view)
    \ |   redraw
    \ | endif
augroup END
