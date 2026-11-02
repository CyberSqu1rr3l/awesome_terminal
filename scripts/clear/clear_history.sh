#!/bin/bash

# NOTE: Provide the complete list of files that shall be deleted.
declare -a history_files=(
    "/home/$(whoami)/.bash_history"
    "/home/$(whoami)/.octave_hist"
    "/home/$(whoami)/.python_history"
    "/home/$(whoami)/.lesshst"
    "/home/$(whoami)/.vim/.netrwhist"
    "/home/$(whoami)/.viminfo"
    "/home/$(whoami)/.config/cmus/command-history"
    "/home/$(whoami)/.config/cmus/search-history"
    "/home/$(whoami)/.local/share/rtv/history.log"
)

for item in "${history_files[@]}"
do
    if [ -f "$item" ]
    then
        rm "$item"
    fi
done

cp /home/$(whoami)/.vim/config/.viminfo /home/$(whoami)/.viminfo
