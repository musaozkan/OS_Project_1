#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Use sed to replace numbers in the range 0-9 with their textual representations
sed -i 's/0/zero/g; s/1/one/g; s/2/two/g; s/3/three/g; s/4/four/g; s/5/five/g; s/6/six/g; s/7/seven/g; s/8/eight/g; s/9/nine/g' "$filename"
