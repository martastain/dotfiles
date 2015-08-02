#!/bin/bash


while IFS= read -r file
do
    [ -f "$file" ] && cp "$file" ~
done < "list_files"

while IFS= read -r file
do
    [ -f "$file" ] && cp -r "$file" ~
done < "list_dirs"
