#!/bin/bash

# Function to display the structure recursively
function display_structure {
    local path=$1
    local prefix=$2

    # Use find to safely list all files and directories in the current directory
    find "$path" -mindepth 1 -maxdepth 1 | while read -r item; do
        if [ -d "$item" ]; then
            # If it's a directory, display it and recurse
            echo "${prefix}|--$(basename "$item")"
            display_structure "$item" "${prefix}    "
        else
            # If it's a file, display it
            echo "${prefix}|--$(basename "$item")"
        fi
    done
}

# Function to resolve absolute path with fallback if realpath is not available
function resolve_path {
    if command -v realpath > /dev/null; then
        realpath "$1"
    else
        # Fallback method to resolve absolute path
        echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
    fi
}

# Main script starts here
if [ -z "$1" ]; then
    echo "Error: No directory path provided.\nUsage: $0 <path-to-directory>\nExample: $0 ./my_project"
    exit 1
fi

# Resolve the absolute path and extract the project name
absolute_path=$(resolve_path "$1")
project_name=$(basename "$absolute_path")

# Ensure the project name is valid
if [ -z "$project_name" ]; then
    echo "Error: Unable to determine the project name. Please provide a valid directory path."
    exit 1
fi

# Display the project name
echo "[$project_name]"

# Start the recursive display
if [ -d "$absolute_path" ]; then
    display_structure "$absolute_path" ""
else
    echo "Error: The provided path is not a directory.\nPlease provide a valid directory path."
    exit 1
fi
