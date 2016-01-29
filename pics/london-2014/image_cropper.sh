#!/bin/bash

mkdir -p cropped

for f in $@; do

    filename=$(basename "$f")
    extension="${filename##*.}"
    filename="${filename%.*}"

    convert $f -crop 400x400+30+30 cropped/${filename}_cropped.${extension}

done
