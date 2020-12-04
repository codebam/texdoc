#!/bin/sh

if [ -z "$1" ]; then
    printf "./build.sh file.ext\n"
    printf "error: specify the document you want to build into tex\n"
    exit 1
fi

if [ -z "$(which tectonic)" ]; then
    printf "error: tectonic not installed"
fi

if [ -z "$(which pandoc)" ]; then
    printf "error: pandoc not installed"
fi

document="$1"
filename=$(echo "$document" | cut -f 1 -d '.')

pandoc -s "$document" -o "$filename".tex
tectonic "$filename".tex
