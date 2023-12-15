#!/bin/bash

filename=$1

if [ ! -e "$filename" ]; then
    echo "The file $filename does not exist."
elif [ -f "$filename" ]; then
    echo "The file $filename is an ordinary file with the following properties:"
    echo "- Access permissions: $(stat -c '%A' $filename)"
    echo "- Size: $(stat -c '%s' $filename) bytes"
    echo "- Last modified: $(stat -c '%y' $filename)"
elif [ -d "$filename" ]; then
    num_files=$(ls -l $filename | grep "^-" | wc -l)
    num_subdirs=$(ls -l $filename | grep "^d" | wc -l)
    echo "The file $filename is a directory containing $num_files files and $num_subdirs subdirectories."
fi
