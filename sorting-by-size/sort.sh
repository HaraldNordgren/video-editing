#!/bin/bash

nbr_of_dirs=4

# Go to directory if specified, otherwise execute in current directory
if [ -n "$1" ]; then
    cd $1
fi

# Create directories and store them in an array
for i in $(seq 1 $nbr_of_dirs); do
    dir=dir_$i
    mkdir $dir
    dirs[i]=$dir
done

# For every non-directory, in decreasing size:
# find out the current smallest directory and move the file there
ls -pS | grep -v / | while read line; do
    smallest_dir=$(du -S ${dirs[@]} | sort -n | head -1 | cut -f2)
    mv "$line" $smallest_dir
done
