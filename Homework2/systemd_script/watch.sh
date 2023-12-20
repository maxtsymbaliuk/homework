#!/bin/bash

watch_directory=/home/maksymtsymbaliuk/watch


lock_file="$watch_directory/.lock"

# Ensure the watch directory exists
mkdir -p "$watch_directory"

# Function to process a new file
process_file() {
    local file=$1
    local filename=$(basename "$file")

    echo "New file detected: $filename"
    cat "$file"

    # Create a backup with a timestamp
    local timestamp=$(date +"%Y%m%d%H%M%S")
    mv "$file" "$watch_directory/${filename}.${timestamp}.back"
}

# Watch for new files
while true; do
    for file in "$watch_directory"/*; do
        # Check if it's a new file and not locked
        if [[ -f "$file" && ! -f "$lock_file" && ! "$file" =~ \.back$ ]]; then
            process_file "$file"
            touch "$lock_file"
        fi
    done

    # Remove lock file after processing
    rm -f "$lock_file"

    sleep 1  # Adjust the sleep time as needed
done
