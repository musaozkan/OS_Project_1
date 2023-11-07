#!/bin/bash

# Check if a file name is provided as an argument
if [ $# -eq 0 ]; then
    echo "'$0' + 'filename'"
    exit 1
fi

filename=$1 #First argument is the filename

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 2
fi

# Create an array to store the counts for numbers
declare -A counter_array

for i in {0..9}; do
    counter_array[$i]=0
done

# Read each line
while IFS= read -r num; do
	((counter_array[$num]++)) # Incrementing for a specific var'able 'num' 
done < "$filename"

# Histogram
for i in {0..9}; do
    echo -n "$i "
    for ((j=0; j<${counter_array[$i]}; j++)); do
        echo -n "*"
    done
    echo # Newline for the end of the each row
done

