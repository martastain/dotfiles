#!/bin/bash


while IFS= read -r file
do
    [ -f "$file" ] && cp "$file" ~
done < "list_files"

while IFS= read -r file
do
    [ -d "$file" ] && cp -R "$file" ~
done < "list_dirs"
