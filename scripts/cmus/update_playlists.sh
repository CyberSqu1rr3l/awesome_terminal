#!/bin/bash

# Make sure the necessary configuration directory for cmus exists.
CONFIG="/home/$(whoami)/.config/cmus/playlists/"
if [[ ! -d $CONFIG ]]; then
	echo "ERROR: There was no configuration directory for cmus found."
    echo "       $CONFIG"
	exit 1
fi

# Remove the library file and create a new one.
rm $CONFIG../lib.pl
touch $CONFIG../lib.pl

# Remove all the playlist files if the directory can be changed.
cd $CONFIG && rm ./*

# Create a new playlist for every music genre sorted in directories.
for genre in $MUSIC/*; do
    if [ -d "$genre" ]
    then
	    touch "${genre##*/}"
	    find $genre -type f	>> ${genre##*/}
	    find $genre -type f	>> ../lib.pl
    fi
done

# Create a new playlist for every podcasts.
for podcast in $PODCASTS/*; do
	if [ -d "$podcast" ]
	then
		touch "${podcast##*/}"
		find $podcast -type f >> ${podcast##*/}
	fi
done

# Create a new playlist containing all the radio stations.
touch "radio-stations"

for radio in $RADIO/*.pls; do
    grep "http*" "$radio" | cut -c7- >> ./radio-stations
done

if [[ -f ".radio-stations.swp" ]]; then
    rm ".radio-stations.swp"
fi
