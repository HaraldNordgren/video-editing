#!/bin/bash

mkdir -p mp3

for s in {0..5}; do
    ffmpeg -i pa-sparet-sasong-26-avsnitt-5.mp4 -ss 00:15:32.02 \
        -to 00:18:43.2 -c:a libmp3lame -qscale:a $s \
        mp3/maja_francis_royals_qscale$s.mp3 -y
done
