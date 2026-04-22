#!/bin/bash

set -euo pipefail

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <output_filename.csv>"
    exit 1
fi

TARGET_DIR=$1
OUTPUT_FILE=$2

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Verify it's a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: '$TARGET_DIR' is not a git repository."
    exit 1
fi

echo "Exporting logs from $TARGET_DIR to $OUTPUT_FILE..."

# Create header
echo '"Hash","Date","Author","Subject"' > "$OUTPUT_FILE"

# Append git logs
# Using the Excel-friendly format for the hash: "=""%h"""
git log --no-merges --date=format:'%Y-%m-%d %H:%M' --pretty=format:'"%h","%ad","%an","%s"' --abbrev-commit --abbrev=8 $TARGET_DIR >> "$OUTPUT_FILE"

echo "Done! File saved at: $(pwd)/$OUTPUT_FILE"
