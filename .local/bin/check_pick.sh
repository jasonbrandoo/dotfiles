#!/bin/bash

# Assign the first argument to a variable
TARGET_HASH=$1
CURRENT_BRANCH=$(git branch --show-current)

# Check if an argument was actually provided
if [ -z "$TARGET_HASH" ]; then
    echo "Error: Please provide a commit hash."
    echo "Usage: ./check-pick.sh <hash>"
    exit 1
fi

# The logic
if git branch -a --contains "$TARGET_HASH" | grep -q "$CURRENT_BRANCH"; then
    echo "Result: Commit $TARGET_HASH already exists in $CURRENT_BRANCH. Doing nothing."
else
    echo "Result: Commit $TARGET_HASH not found in $CURRENT_BRANCH. Cherry-picking..."
    git cherry-pick "$TARGET_HASH"
fi
