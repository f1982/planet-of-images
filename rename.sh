#!/bin/bash

# Display a warning message
echo "Warning: This script will rename files in the current folder. Make sure to have a backup if needed."
read -p "Do you want to continue? (y/n): " choice

# Check user choice
if [ "$choice" != "y" ]; then
  echo "Script aborted by user."
  exit 1
fi

# Iterate through files in the current folder
for file in *; do
  # Check if it's a file (not a directory)
  if [ -f "$file" ]; then
    # Remove unwanted part of the filename
    new_name=$(echo "$file" | sed 's/- Find & Share on GIPHY//g')
    
    # Convert to lowercase, replace spaces, &, and other special characters with dashes
    new_name=$(echo "$new_name" | tr '[:upper:]' '[:lower:]' | tr -s '[:space:]&' '-')
    
    # Remove quotes
    new_name=$(echo "$new_name" | tr -d "'\"")
    
    # Rename the file
    mv "$file" "$new_name"
  fi
done

echo "Script completed successfully."
