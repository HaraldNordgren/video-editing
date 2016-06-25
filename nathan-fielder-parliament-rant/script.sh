#!/bin/bash

ffmpeg -i Nathan\'s\ Nook\ 1\ -\ Parliament\ Rant.mp4 -ss 12.26 -t 9 \
    -c:v libx264 -c:a copy parliament-hill-ffmpeg.mp4 -y
