PROMPT='%{$fg_bold[yellow]%}➜ %{$fg_bold[white]%}%n%{$fg[blue]%} at %{$fg_bold[magenta]%}%m%{$fg_bold[yellow]%} %{$fg[blue]%}in %{$fg_bold[green]%}%p%{$fg[cyan]%}$(get_dir) %{$fg_bold[green]%} > % %{$reset_color%} '
RPROMPT='%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}$(gopath_set)%{$reset_color%}$(mode_prompt)'
 
NORMAL_INDICATOR="%{$fg_bold[cyan]%} [% VI NORMAL MODE]% %{$reset_color%}"
EDIT_INDICATOR="%{$fg_bold[white]%} [% VI EDIT MODE]% %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="svn:("
ZSH_THEME_SVN_PROMPT_SUFFIX=")"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[yellow]%} ✘ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN=" "

function get_dir() {
  DIR=$(basename "`pwd`" | sed "s/dstephen/\~/")
  echo "$DIR"
}

function mode_prompt() {
  echo "${${KEYMAP/vicmd/$NORMAL_INDICATOR}/(main|viins)/$EDIT_INDICATOR}"
}

function gopath_set() {
  if [[ -z ${GOPATH+x} ]]; then
    echo ""
  else
    cd $GOPATH
    REAL_GOPATH=$(pwd | sed "s/\/Users\/dstephen/\~/")
    GO_INDICATOR="%{$fg_bold[green]%} [% GOPATH:$REAL_GOPATH]% %{$reset_color%}"
    echo "${GO_INDICATOR}"
  fi
}
