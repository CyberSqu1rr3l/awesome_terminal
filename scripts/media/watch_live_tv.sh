#!/bin/bash

echo "------------------------------"
echo "|      Live TV Stations      |"
echo "------------------------------"
echo ""
echo ">> please select a station from the list: "

declare -a tv_stations=(
    "https://streamer-a01.videos.sapo.pt/live/portocanal/playlist.m3u8           Porto-Canal    "
    "https://streaming.cnnbrasil.com.br/cnndigital_main.m3u8                     CNN-Brasil     "
    "http://wz4.dnip.com.br/bemtv/bemtv.sdp/playlist.m3u8                        SBT            "
    "https://596639ebdd89b.streamlock.net/8032/8032/index.m3u8                   COM-Brasil     "
    "http://zdf-hls-15.akamaized.net/hls/live/2016498/de/veryhigh/master.m3u8    ZDF            "
    "https://artelive-lh.akamaihd.net/i/artelive_de@393591/index_1_av-p.m3u8     ARTE           "
    "https://mcdn.one.ard.de/ardone/hls/master.m3u8                              ONE            "
    "https://zdf-hls-16.akamaized.net/hls/live/2016499/de/veryhigh/master.m3u8   ZDF-NEO        "
    "https://bozztv.com/teleyupp1/teleup-ydcl2V1MVC/playlist.m3u8                CBC-Toronto    "
    "http://103.199.161.254/Content/bbcworld/Live/Channel(BBCworld)/index.m3u8   BBC-World-News "
    "https://pbs-samsunguk.amagi.tv/playlist.m3u8                                PBS-America    "
    "https://cdn-videos.akamaized.net/btv/desktop/akamai/us/live/primary.m3u8    Bloomberg      "
    "https://content.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be.m3u8    ABC-News-Live  "
    "https://ntv1.akamaized.net/hls/live/2014075/NASA-NTV1-HLS/master_2000.m3u8  NASA-TV-Public "
    "https://ntv2.akamaized.net/hls/live/2013923/NASA-NTV2-HLS/master.m3u8       NASA-TV-Media  "
    "https://cnn-cnninternational-1-de.samsung.wurl.com/manifest/playlist.m3u8   CNN            "
)

# Print a list of all the stations.
echo "----------------------------------------------------------------------------------------------"
for station in "${tv_stations[@]}"
do
    echo "| $station |"
done
echo "----------------------------------------------------------------------------------------------"

read selected_station
# Retrieve only the first word from the input line.
selected=$(echo $selected_station | awk '{print $1;}')
# Add a blank character to match the string to only one word.
selected=$(echo "$selected_station ")

# Choose the matching URL from the list.
matching_url=""
for station in "${tv_stations[@]}"
do
    if [[ $station == *$selected* ]]; then
        url=$(echo $station | awk '{print $1;}')
        matching_url=$url
    fi
done

echo ""

if [[ $matching_url == "" ]]; then
    echo ">> could not find matching station specification ... exiting"
    exit 0
fi

mpv $matching_url
