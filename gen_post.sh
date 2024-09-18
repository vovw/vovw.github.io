#!/bin/bash

convert_file() {
    local input_file="$1"
    local filename=$(basename "$input_file")
    local filename_without_extension="${filename%.*}"
    
    pandoc -H template.html \
	    -s --mathjax \
        --toc --highlight-style tango.theme \
        --resource-path=media \
        --css <(echo "") \
        -f markdown "$input_file" > "blog/${filename_without_extension}.html"
    
    echo "Converted: ${filename_without_extension}.html"
}

convert_all() {
    for file in md/*.md; do
        convert_file "$file"
    done
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [-a|--all] or $0 <filename>"
    exit 1
fi

# Check if the argument is -a or --all
if [ "$1" = "-a" ] || [ "$1" = "--all" ]; then
    convert_all
else
    # Get the file name from the argument
    filename="$1"
    # Check if the file exists
    if [ ! -f "md/${filename}.md" ]; then
        echo "Error: File 'md/${filename}.md' not found."
        exit 1
    fi
    convert_file "md/${filename}.md"
fi

echo "Conversion complete. Output saved in the 'blog' folder."
