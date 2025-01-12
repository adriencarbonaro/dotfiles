# Setup fzf
# ---------
if [[ ! "$PATH" == */home/adrien/dev/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/adrien/dev/fzf/bin"
fi

source <(fzf --zsh)
