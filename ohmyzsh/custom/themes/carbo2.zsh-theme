function get_pwd() {
  echo "${PWD/$HOME/~}"
}

local ret_status="%(?:%B%F{yellow}→ :%B%F{red}→ )"
PROMPT='
%B%F{yellow}%n %B%F{blue}$(get_pwd) $(git_prompt_info)
${ret_status} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{blue}%{$reset_color%}%B%F{magenta}λ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{blue} %B%F{red}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{blue}"
