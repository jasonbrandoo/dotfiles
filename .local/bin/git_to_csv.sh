#!/bin/bash

# Usage instructions
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Usage: $0 <directory_path> <output_filename.csv> [regex_search]"
    echo "Example: $0 ./src/Pages/ report.csv \"fix\(UI\)|bug\""
    exit 1
fi

TARGET_DIR=$1
OUTPUT_FILE=$2
SEARCH_REGEX=${3:-""} # Optional 3rd argument

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Navigate to target directory
cd "$TARGET_DIR" || exit

# Verify it's a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: '$TARGET_DIR' is not a git repository."
    exit 1
fi

# Build Git log options array
GIT_ARGS=(
    "--no-merges"
    "--date=format:%Y-%m-%d %H:%M"
    "--pretty=format:\"=\"\"%h\"\"\",\"%ad\",\"%an\",\"%s\""
)

# If regex is provided, add grep and extended regex flags
if [ -n "$SEARCH_REGEX" ]; then
    GIT_ARGS+=("--extended-regexp" "--grep=$SEARCH_REGEX" "-i")
    echo "Exporting logs matching regex '$SEARCH_REGEX' from $TARGET_DIR to $OUTPUT_FILE..."
else
    echo "Exporting all logs from $TARGET_DIR to $OUTPUT_FILE..."
fi

# Create CSV header
echo '"Hash","Date","Author","Subject"' > "$OUTPUT_FILE"

# Append git logs using array expansion to preserve quotes correctly
git log "${GIT_ARGS[@]}" >> "$OUTPUT_FILE"

echo "Done! File saved at: $(pwd)/$OUTPUT_FILE"
