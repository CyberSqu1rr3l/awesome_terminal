#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
STYLES_DIR="$ROOT/styles"

usage() {
  printf 'Usage: %s [list|all|style]\n' "$0"
}

list_styles() {
  printf 'Available prompts:\n'
  local file
  for file in "$STYLES_DIR"/*.sh; do
    [[ -f $file ]] || continue
    printf '  [+] %s\n' "$(basename "$file" .sh)"
  done
}

preview_style() {
  local file=$1
  local name
  name=$(basename "$file" .sh)

  bash --noprofile --norc -c '
    source "$1"
    printf "%s%s\n" "${PS1@P}" "$2"
  ' _ "$file" "$name"

  printf '\n'
}

case ${1:-list} in
  list)
    list_styles
    ;;
  all)
    for file in "$STYLES_DIR"/*.sh; do
      [[ -f $file ]] || continue
      preview_style "$file"
    done
    ;;
  -h|--help)
    usage
    ;;
  *)
    name=$1
    if [[ ! $name =~ ^[a-zA-Z0-9_-]+$ ||
          ! -f $STYLES_DIR/$name.sh ]]; then
      printf 'Unknown style: %s\n' "$name" >&2
      usage >&2
      exit 1
    fi
    preview_style "$STYLES_DIR/$name.sh"
    ;;
esac

