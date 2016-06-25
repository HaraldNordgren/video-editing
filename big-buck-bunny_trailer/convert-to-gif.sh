#!/bin/bash

set -e

for w in ./*.webm; do
    ffmpeg -i "$w" -vf palettegen "${w%.*}.png"
    ffmpeg -i "$w" -i "${w%.*}.png" -lavfi "${w%.*}.gif" -y
    rm "$w"
done
