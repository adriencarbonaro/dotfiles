#------------------------------------------------------------
# ZSH - terminal shell
#
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
# Move this file to $HOME/.zshrc
#------------------------------------------------------------
# Author:       Adrien CARBONARO
# Dotfiles :    www.github.com/adriencarbonaro/dotfiles.git
#------------------------------------------------------------

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="carbo"
TOP_DIR="$HOME"

# Path to your oh-my-zsh installation.
export ZSH="$TOP_DIR/.oh-my-zsh"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

## zsh-syntax-highlighting style 
# Change syntax highlighting colors
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta
ZSH_HIGHLIGHT_STYLES[path]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[triple-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=yellow
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=yellow
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=magenta

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $TOP_DIR/.bash_aliases

# -- EXA ----------
if [ -x "$(command -v exa)" ]
then
    source $TOP_DIR/.aliases_exa
fi

# -- FZF ----------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SHELL=/bin/zsh
export VISUAL=vim
export EDITOR="$VISUAL"

# dotfiles paths
export ZSHRC="$HOME/.zshrc"
export VIMRC="$HOME/.vimrc"
export NVIMRC="$HOME/.nvimrc"
export ACKRC="$HOME/.ackrc"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export TIGRC="$HOME/.tigrc"
export ALIASES="$HOME/.bash_aliases"
export VIM_COLOR="$HOME/.vim/colors/carbo.vim"
export ZSH_COLOR="$HOME/.oh-my-zsh/custom/theme/carbo.zsh-theme"
export I3_CONFIG="$HOME/.config/i3/config"
export POLYBAR_CONFIG="$HOME/.config/polybar/config"
export ROFI_CONFIG="$HOME/.config/rofi/config"
export ROFI_COLOR="$HOME/.config/rofi/carbo.rasi"
export COMPTON_CONFIG="$HOME/.config/compton.conf"
export DUNST_CONFIG="$HOME/.config/dunst/dunstrc"
export DOTFILES="$HOME/dotfiles"
export LS_COLORS="$LS_COLORS:di=34:ln:36"
export EXA_COLORS="ln=36:ex=32:di=34:*.zip=31:*.gz=31:*.md=33:*.png=35:*.jpg=35:33:ga=37:gm=33:gd=33:gv=33:gt=33:uu=36:sb=33:sn=33:uw=36:gw=36:tw:36:ue=32:ux=32:gx=32:tx=32:ur=34:gr=34:tr=34:da=35"
export TODO="$HOME/TODO"
export FZF_DEFAULT_COMMAND='find .'

export PATH="$PATH:$HOME/bin:/home/linuxbrew/.linuxbrew/bin"
export PYTHONPATH="$PYTHONPATH:$HOME/lib/python"
export SOCCER_CLI_API_TOKEN=5eb8bc4a2eaa4fd9bc7cfb7db78d621a
export LESS="-RX"

#if [ -x "$(command -v neofetch)" ]
#then
    #neofetch --color_blocks off
    #colorpanes
#fi

