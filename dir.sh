#!/bin/bash

# Check if an argument (root directory) is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <root_directory>"
    exit 1
fi

# Function to print directory tree recursively
print_tree() {
    local dir="$1"
    local prefix="$2"

    # Print current directory
    echo "${prefix}├── $(basename "$dir")/"

    # Get list of items in the directory, excluding hidden files/directories
    local items=$(ls -A "$dir")

    # Loop through each item
    for item in $items; do
        local path="$dir/$item"
        if [ -d "$path" ]; then
            # Recursively print tree for directories
            print_tree "$path" "${prefix}│   "
        elif [ -f "$path" ]; then
            # Print regular files
            echo "${prefix}│   ├── $item"
        fi
    done
}

# Start printing tree from the root directory provided as argument
print_tree "$1" ""
