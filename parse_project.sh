#!/bin/bash

# Function to display the structure recursively
function display_structure {
    local path=$1
    local prefix=$2

    # List all files and directories in the current directory
    for item in $(ls "$path"); do
        if [ -d "$path/$item" ]; then
            # If it's a directory, display it and recurse
            echo "${prefix}|--$item"
            display_structure "$path/$item" "${prefix}    "
        else
            # If it's a file, display it
            echo "${prefix}|--$item"
        fi
    done
}

# Main script starts here
if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-directory>"
    exit 1
fi

# Resolve the absolute path and extract the project name
absolute_path=$(realpath "$1")
project_name=$(basename "$absolute_path")

# Display the project name
echo "[$project_name]"

# Start the recursive display
if [ -d "$absolute_path" ]; then
    display_structure "$absolute_path" ""
else
    echo "Error: The provided path is not a directory."
    exit 1
fi
