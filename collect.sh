#!/bin/bash


while IFS= read -r file
do
    [ -f "$file" ] && cp ~ "$file"
done < "list_files"
