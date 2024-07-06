#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Get the file name from the argument
filename="$1"

# Remove the file extension if present
filename_without_extension="${filename%.*}"

pandoc -H template.html \
    --toc --highlight-style tango.theme \
    --resource-path=media \
    --css <(echo "") \
    -f markdown "md/${filename}.md" > blog/${filename_without_extension}.html



open blog/${filename_without_extension}.html

echo "Conversion complete. Output saved as blog/${filename_without_extension}.html"

