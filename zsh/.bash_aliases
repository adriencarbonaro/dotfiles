# ls aliases -------------------------------------------------------------------
alias ll='ls -lha'
alias lla='ls -hlFa'
alias llt='ls -hlFt'
alias lls='ls -hlFS'
alias llat='ls -hlFat'
alias llas='ls -hlFaS'
alias llc='l | lc'
alias la='ls -A'
alias l='ls -lh'
# System commands aliases ------------------------------------------------------
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias dd="dd status=progress"
alias chown="chown -v"
alias chmod="chmod -v"
alias mount="mount -v"
alias cl="clear && l"
alias cls="clear"
alias qq="exit"
# Git aliases ------------------------------------------------------------------
alias gits='git status'
alias gg='git status'
alias gl='git compactLog'
alias gll='git fullLog'
alias gla='git compactLogAll'
alias glla='git fullLogAll'
alias glc='git compactLog -10'
alias gb='git branch'
alias grp='git rev-parse HEAD'
# Program aliases --------------------------------------------------------------
alias fsizeall="du * .* -bhs | sort -h"
alias fsize="du * -bhs | sort -h"
alias openn="mimeopen"
alias trash="gvfs-trash"
alias weather="curl wttr.in/Boulogne"
alias wificonnect="nmcli con up id"
alias ff="fzf"
alias chrome='chromium-browser'
alias armgcc="arm-linux-gnueabi-gcc"
alias text="figlet -f Basic"
alias text3D="figlet -f ANSI\ Shadow"
alias tiga="tig --all"
alias pipe="pipes.sh -s 5 -r 0"
alias pipelc="pipes.sh -s 5 -r 0|lc"
alias md="typora"
alias ag="ag --hidden --color-match \"1;33\" --color-line-number \"1;34\""
# Other aliases ----------------------------------------------------------------
alias CDEV="cd $HOME/OROSOUND/tilde-dev"
alias CDTER="cd $HOME/OROSOUND/terminal-py3"
