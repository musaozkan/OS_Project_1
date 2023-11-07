#!/bin/bash

find_txt_file() {
  pathname="$1"

  # Find the oldest .txt file in the specified directory
  oldest_file=$(find "$pathname" -type f -name "*.txt" -printf '%T+ %p\n' | sort | head -n 1 | awk '{print $2}')
  echo "$oldest_file"
}

delete_txt_file() {
  file="$1"

  if [ -z "$file" ]; then
    echo "No .txt files found."
    exit 1
  fi

  # Prompt the user for deletion confirmation
  echo -n "Do you want to delete $file? (y/n): "
	read choice

  # Check the user's choice and delete the file if 'y' is entered
  if [ "$choice" == "y" ]; then
    rm "$file"
    echo "The $file is deleted!"
  else
    echo "The $file is not deleted."
  fi
}

# Check if an argument (pathname) is provided
if [ $# -eq 0 ]; then
  # No argument provided, use the current working directory
  pathname="."
else
  pathname="$1"
fi

# Find the oldest .txt file
oldest_txt_file=$(find_txt_file "$pathname")

# Delete the oldest .txt file
delete_txt_file "$oldest_txt_file"
