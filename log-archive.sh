#!/bin/bash

SOURCE_DIR=$1
TARGET_DIR="/var/logs/$(date +"%m_%Y")"

# Checking if the source directory is provided
if [ -z "$SOURCE_DIR" ]; then
    echo "USAGE: log-archive <log-directory>"
    exit 1
fi

# Checking if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: The source directory does not exist"
    exit 2
fi

# Checking if the source directory has read permissions
if [ ! -r "$SOURCE_DIR" ]; then 
    echo "Error: Missing read permission for the source directory: $SOURCE_DIR"
    exit 3
fi

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create target directory: $TARGET_DIR"
        exit 4
    fi
fi

# Checking if the target directory has write permissions
if [ ! -w "$TARGET_DIR" ]; then
    echo "Error: Missing write permission for the target directory: $TARGET_DIR"
    exit 5
fi

TIMESTAMP=$(date +"%s")

# Archive filename based on source directory name
ARCHIVE_NAME="logs_archive_$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz"
ARCHIVE_PATH="$TARGET_DIR/$ARCHIVE_NAME"

# Creating the archive
echo "Creating archive..."
tar czf "$ARCHIVE_PATH" -C "$SOURCE_DIR" . 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the archive!"
    exit 6
fi

echo "Archive created successfully: $ARCHIVE_PATH"
exit 0
