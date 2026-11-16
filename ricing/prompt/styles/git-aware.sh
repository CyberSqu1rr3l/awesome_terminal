__gallery_git_branch() {
  local branch
  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || return 0
  printf ' (%s)' "$branch"
}
PS1='\[\e[36m\]\w\[\e[0m\]\[\e[33m\]$(__gallery_git_branch)\[\e[0m\]\n\$ '
