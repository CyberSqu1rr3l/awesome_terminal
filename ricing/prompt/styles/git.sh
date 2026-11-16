__gallery_git() {
  local branch
  branch=$(git branch --show-current 2>/dev/null) || return
  [[ -z $branch ]] && return

  printf ' \e[33m %s' "$branch"

  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf ' \e[31m✗'
  else
    printf ' \e[32m✓'
  fi
}

PS1='\[\e[1;36m\]\w\[\e[0m\]$(__gallery_git)\n\[\e[1;32m\]❯ \[\e[0m\]'
